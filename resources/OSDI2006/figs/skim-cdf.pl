#!/usr/bin/perl

$DISTINCR = 0.5;

while (<>) {
  if ($pct == 0) { print; }
  ($throwaway,$pct,$err) = split;
  if ($pct == 1.0) { print; }

  $pd = $pct - $lastpct;
  $ed = $err - $lasterr;
  $dist = sqrt ($pd*$pd + $ed*$ed);
  if ($dist >= $DISTINCR) { 
    print; 
    $lastpct = $pct;
    $lasterr = $err;
  }

}
