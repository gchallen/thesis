#!/usr/bin/perl

# This script processes 'node-all.status.gz' to find reprograms of nodes

open(INFILE, "gunzip -c node-all.status.gz|") || die "Can't open input.\n";

print "# time nodeID swversion\n";

# Convert from real node ID to fake node ID
$fakenode{"200"} = 200;
$fakenode{"201"} = 201;
$fakenode{"202"} = 202;
$fakenode{"203"} = 203;
$fakenode{"204"} = 204;
$fakenode{"205"} = 205;
$fakenode{"206"} = 206;
$fakenode{"207"} = 207;
$fakenode{"208"} = 208;
$fakenode{"209"} = 209;
$fakenode{"210"} = 210;
$fakenode{"212"} = 211;
$fakenode{"213"} = 212;
$fakenode{"214"} = 213;
$fakenode{"250"} = 214;
$fakenode{"251"} = 215;

getline:
while (<INFILE>) {
  ($time, $nodeid, $swver) = split;
  if ($nodeid < 200) { next getline; }
  $nodeid = $fakenode{$nodeid};
  if ($swversion{$nodeid} != $swver) {
    print "$time $nodeid $swver\n";
    $swversion{$nodeid} = $swver;
  }
}

