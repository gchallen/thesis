#!/usr/bin/perl

# Generates a CDF of the given data file
# Usage:
#  cdf.pl <filename> <column with data points> <bucket size>

$FILENAME = shift @ARGV;
$VALUECOLUMN = shift @ARGV;
$BUCKETSIZE = shift @ARGV;

$CMD = "stats.pl -f $FILENAME -h $BUCKETSIZE $VALUECOLUMN";
open(CMD, "$CMD|") || die "Cannot run: $CMD\n";

$bucketnum = 0;
while (<CMD>) {
  if (/^BUCKET (\S+) COUNT (\d+)/) {
    $sum += $2;
    $bucketvalue[$bucketnum] = $1;
    $bucketcount[$bucketnum] = $sum;
    $bucketnum++;
  }
}

print "# CDF generated from file: $FILENAME\n";
print "# Value column: $VALUECOLUMN\n";
print "# Bucket size: $BUCKETSIZE\n";
print "# Format:\n";
print "# CDF: <bucketvalue> <probability x <= bucketvalue>\n";

for ($b = 0; $b <= $bucketnum; $b++) {
  $bucketcount[$b] /= ($sum*1.0);
  print "CDF: $bucketvalue[$b] $bucketcount[$b]\n";
}

