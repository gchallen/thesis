#!/usr/bin/perl

# Time in the input file is in *days* for some reason.
# It is also sorted by 
$TIMEWINDOW = 1.0 / 24.0;

print "# <time in days>\t<triggers>\t<global triggers>\n";

open(INFILE, "eruptTriggers.dat") || die "Cannot open eruptTriggers.dat";
$starttime = 0;
$triggers = 0;
$lastnode = 0;

while (<INFILE>) {
  ($time, $node) = split;

  next if (!(/^\d/));

  $bin = int($time / $TIMEWINDOW);

  # Node 216 represents the 'global' triggers so it's not real.
  if ($node == 216) {
    $globaltriggers{$bin}++;
  } else {
    $triggers{$bin}++;
  }
}

foreach $bin (sort { $a <=> $b } keys(%triggers)) {
  $realtime = ($bin * $TIMEWINDOW);
  if ($globaltriggers{$bin} == 0) {
    $gt = 0;
  } else {
    $gt = $globaltriggers{$bin};
  }
  print "$realtime\t$triggers{$bin}\t$gt\n";
}


