#!/usr/bin/perl

# This script processes 'statusmsg-counts-bytime-bynode.dat'
# to measure the downtime of the network by node and overall.
# This is tricky because we need to take into account the time
# that each node came back up following the 'big crash'.

$START_TIME = -1;
$END_TIME = -1;

# The following values are derived by looking at the data file.
# The few blips of reports around 1872516...1872518 are not
# counted as being "up".
$OUTAGE_START = 1872430;
$OUTAGE_BLIP = 1872518;
$OUTAGE_FIRSTEND = 1872883;
$OUTAGE_LASTEND = 0; # Will calculate based on data

getline:
for (<>) {
  if (/^#/) { next getline; }
  ($nodeid, $count, $time) = split;
  if ($nodeid < 200) { next getline; }
  if ($START_TIME == -1) { $START_TIME = $time; }
  $uptime{$nodeid}++;
  if ($timecounted{$time} == 0) {
    $timecounted{$time} = 1;
    $totaluptime++;
  }
  if ($time > $OUTAGE_BLIP && $back_up{$nodeid} == 0) {
    $back_up{$nodeid} = $time;
    $outage_time{$nodeid} = $time - $OUTAGE_START;
    if ($time > $OUTAGE_LASTEND) { $OUTAGE_LASTEND = $time; }
  }
}
$END_TIME = $time;

$totaltime = $END_TIME-$START_TIME;
printf "# Total time is $totaltime blocks\n";

# Need two metrics here: Entire length of outage and the initial
# outage when *all* nodes were down (and nothing was reported).
$OUTAGE_TOTAL_DURATION = $OUTAGE_LASTEND - $OUTAGE_START;
$OUTAGE_ALLDOWN_DURATION = $OUTAGE_FIRSTEND - $OUTAGE_START;
$outagepct = ($OUTAGE_TOTAL_DURATION / $totaltime) * 100.0;
printf "# Massive outage: $OUTAGE_TOTAL_DURATION blocks or %0.4f %%\n", $outagepct;

# We don't consider the base to be down during the initial outage
$basedowntime = ($totaltime - $totaluptime) - $OUTAGE_ALLDOWN_DURATION;
$basedownpct = ($basedowntime / $totaltime) * 100.0;
printf "# Basestation outage: $basedowntime blocks or %0.4f %%\n", $basedownpct;

foreach $nodeid (sort keys(%uptime)) {
  # Total time a node was down
  $thisnode_down = $totaltime - $uptime{$nodeid};
  # Subtract out outage time
  $thisnode_down_nooutage = $thisnode_down - $outage_time{$nodeid};
  # Subtract out times that entire network was down (outside of the
  #  time this node was down)
  $thisnode_down_nobase = $thisnode_down_nooutage - $basedowntime;

  $thisnode_down_pct = ($thisnode_down / $totaltime) * 100.0;
  $thisnode_down_nooutage_pct = ($thisnode_down_nooutage / $totaltime) * 100.0;
  $thisnode_down_nobase_pct = ($thisnode_down_nobase / $totaltime) * 100.0;

  printf "Node $nodeid : down %0.4f nooutage %0.4f nobase %0.4f\n", $thisnode_down_pct, $thisnode_down_nooutage_pct, $thisnode_down_nobase_pct;

#$down_total = (($totaltime - $uptime{$nodeid}) / $totaltime) * 100.0;
#
#  # Total time a node was down NOT INCLUDING its outage
#  $down_nooutage = (($totaltime - $uptime{$nodeid} - $outage_time{$nodeid}) / $totaltime) * 100.0;
#
#  # Total time a node was down NOT INCLUDING its outage or network
#  # outage.
#  $my_basedowntime = ($totaltime - $totaluptime) - $outage_time{$nodeid};
#  $down_nobase = (($totaltime - $uptime{$nodeid} - $outage_time{$nodeid} - ) / $totaltime) * 100.0;

#  printf "Node $nodeid : %0.4f %% down, %0.4f %% down w/o outage, %0.4f %% down w/o net or outage failures\n", $down_total, $down_nooutage, $down_nobase;
}
