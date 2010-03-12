#!/usr/bin/perl
use strict;
use Cwd;
use File::Basename;
use regression;


# ======================= Main ==================================
my @events = ("2005-08-12_02.15.18", 
              "2005-08-13_01.27.46", 
              "2005-08-15_19.29.08", 
              "2005-08-16_09.45.14");
foreach my $event (@events) {
    my $regFile = "reg_${event}.dat";
    my @xyData = parseDataFile($regFile);
    
    my ($m, $b) = regression::getMB(@xyData);
    my $rr = regression::getR(@xyData);
    print "$event: m= $m, 1/m= " . (1.0/$m) . ", b= $b, R^2= $rr\n";
}


# ======================= Functions ==================================
sub parseDataFile
{
    my ($fileName) = @_;
    my @data;

    foreach my $line (`cat $fileName`) {
        if ( $line =~ /^(\d+.\d+|\d+)\s+(\d+.\d+|\d+)/ ) {
            my $val = {
                x => $1,
                y => $2,
            };          
            push(@data, $val);
        }
    }
    return @data;
}
