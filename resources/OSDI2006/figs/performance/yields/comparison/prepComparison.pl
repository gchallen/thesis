#!/usr/bin/perl
use strict;

# The overall CDF
runCmd("cp ../*ntire/schBlockYieldCDF.dat schBlockYieldCDF_entire.dat");
runCmd("cp ../*eforeReprogram/schBlockYieldCDF.dat schBlockYieldCDF_before.dat");
runCmd("cp ../*fterReprogram/schBlockYieldCDF.dat schBlockYieldCDF_after.dat");
runCmd("gnuplot < \"schBlockYieldCDF.gp\"");

# The bar graphs
runCmd("cp ../*eforeReprogram/nodePercentiles.dat nodePercentiles_before.dat");
runCmd("cp ../*fterReprogram/nodePercentiles.dat nodePercentiles_after.dat");
runCmd("gnuplot < \"nodePercentiles.gp\"");

sub runCmd
{
    my ($cmd) = @_;
    print "runningCmd: $cmd\n";
    system($cmd);
}
