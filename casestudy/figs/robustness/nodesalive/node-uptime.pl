#!/usr/bin/perl

# This script processes 'statusmsg-counts-bytime-bynode.dat'
# to measure the uptime of the network by node and overall.

$START_TIME = -1;
$END_TIME = -1;

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
}
$END_TIME = $time;

$totalpct = ($totaluptime / ($END_TIME-$START_TIME)) * 100.0;
$totaltime = $END_TIME-$START_TIME;
printf "# Total time is $totaltime blocks\n";
printf "# Network is up $totaluptime blocks or %0.4f %%\n", $totalpct;

foreach $nodeid (sort keys(%uptime)) {
  $uppct = ($uptime{$nodeid} / ($END_TIME-$START_TIME)) * 100.0;
  $up2pct = ($uptime{$nodeid} / $totaluptime) * 100.0;
  printf "Node $nodeid up $uptime{$nodeid} blocks, %0.4f %% up, %0.4f %% up without net failures\n", $uppct, $up2pct;
}
