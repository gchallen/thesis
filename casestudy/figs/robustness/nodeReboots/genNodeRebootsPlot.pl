#!/usr/bin/perl
use strict;
use Cwd;
use File::Basename;

my $OFFSET_TIMEMSEC = int(1122854400000);  # Aug 1, 2005 GMT
my $BINSIZE_MSEC = (60*1000*60);           # 10 mins

# ======================= Main ==================================
# (1) - Parse the input file
my @nodeReboots = parseDataFile("nodeReboots.raw");

# (2) - Place the reboots in bins
my %binnedReboots;

foreach my $r (@nodeReboots) {
    my $binTime = int(($r->{timeMsec})/$BINSIZE_MSEC) * $BINSIZE_MSEC;
    if (!exists($binnedReboots{$binTime})) {
        $binnedReboots{$binTime} = 0;
    }
    $binnedReboots{$binTime} += 1;
}

# (3) - Generate gnuplot script and data file 
my $gnuplotScriptFileBinned = genGnuplotScriptBinned(%binnedReboots);
system("gnuplot < \"$gnuplotScriptFileBinned\"");

# (4) - The non-binned
my $gnuplotScriptFile = genGnuplotScript(@nodeReboots);
system("gnuplot < \"$gnuplotScriptFile\"");



# ======================= Functions ==================================

sub msecsToDay {
    my ($timeMsec, $offsetMsec) = @_;
    return 1.0 + ($timeMsec - $offsetMsec)/(1000*60*60*24);
}

# Returns the %eventNodePicks (hashOfHashes) for the given $fileName
# %eventNodePicks parseArrivalTimesFile($fileName)
sub parseDataFile
{
    my ($fileName) = @_;
    my @nodeReboots;

    foreach my $line (`cat $fileName`) {
        if ( $line =~ /^(\d+)\s+(\d+)\s+(\d+.\d+|\d+)\s+(\d+)/ ) {
            my $rec = {
                node     => $1,
                timeMsec => int($2),
                timeSec  => $3,
                count    => $4,
            };          
            push(@nodeReboots, $rec);
            #print "--> $rec->{node} $rec->{timeMsec} \n";
        }
    }
    return @nodeReboots;
}

sub genGnuplotScript
{
    my (@nodeReboots) = @_;

    my %nodeMap = (200 => 1,
                   201 => 2,
                   202 => 3,
                   203 => 4,
                   204 => 5,
                   205 => 6,
                   206 => 7,
                   207 => 8,
                   208 => 9,
                   209 => 10,
                   210 => 11,
                   212 => 12,
                   213 => 13,
                   214 => 14,
                   250 => 15,
                   251 => 16);

    # (1) - The data file
    my $dataFile = "nodeReboots.dat";
    open(GDATA, ">$dataFile") || die "$dataFile\n";
    foreach my $r (@nodeReboots) {
        print GDATA "$r->{node} $nodeMap{$r->{node}} $r->{timeMsec} " . ($r->{timeMsec}/1000.0) . "\n";
    }
    close(GDATA);


    # (2) - The script file
    my $scriptFile = "nodeReboots.gp";
    open(GPLOT, ">$scriptFile") || die "$scriptFile\n";

    #print GPLOT "set title \"Node Reboots\"\n";
    print GPLOT "set xlabel \"Date (August 2005)\"\n";
    print GPLOT "set ylabel \"Node ID\"\n";
    print GPLOT "set grid noxtics ytics\n";
    print GPLOT "set xdata time\n";
    print GPLOT "set timefmt \"%s\"\n";
    print GPLOT "set format x \"%d\"\n";
    print GPLOT "set yrange[0:17]\n";

    # format looks like this:  set ytics ("213" 0, "208" 1, "206" 2)
    # the ytics
    my @nodeKeys = sort(keys(%nodeMap));
    for (my $i; $i <= $#nodeKeys; $i++) {
        if ($i == 0) {print GPLOT "set ytics (";}
        else         {print GPLOT ", ";}
        print GPLOT "\"$nodeKeys[$i]\" $nodeMap{$nodeKeys[$i]}";
    }
    print GPLOT ")\n";

    print GPLOT "set terminal postscript eps enhanced color solid \"Helvetica-18\"\n";
    print GPLOT "set output \"nodeReboots.eps\"\n";
    print GPLOT "plot \"$dataFile\" index 0 using 4:2 notitle with points pt 6\n";

    close(GPLOT);

    return $scriptFile;
}


# Generates a gnuplot script for the given eventNodePicks (hashOfHashes)
# scriptFileName genGnuplotScript(%eventNodePicks);
sub genGnuplotScriptBinned
{
    my (%binnedReboots) = @_;

    # (1) - The data file
    my $dataFile = "nodeRebootsBinned.dat";
    open(GDATA, ">$dataFile") || die "$dataFile\n";
    foreach my $binTime ( sort(keys(%binnedReboots)) ) {
        print GDATA "$binTime " . ($binTime/1000.0) . " $binnedReboots{$binTime}\n";
    }
    close(GDATA);


    # (2) - The script file
    my $scriptFile = "nodeRebootsBinned.gp";
    open(GPLOT, ">$scriptFile") || die "$scriptFile\n";

    #print GPLOT "set title \"Node Reboots\"\n";
    print GPLOT "set xlabel \"Date (August 2005)\"\n";
    print GPLOT "set ylabel \"Nbr of reboots\"\n";
    print GPLOT "set grid noxtics ytics\n";
    #print GPLOT "set logscale y\n";

    print GPLOT "set label \"108 reboots\" at graph 0.4, 0.95\n";
    print GPLOT "set arrow from graph 0.4, 0.95 to graph 0.328, 0.95 lt 7\n";
    print GPLOT "set label \"288 reboots\" at graph 0.4, 0.90\n";
    print GPLOT "set arrow from graph 0.4, 0.90 to graph 0.333, 0.90 lt 7\n";
    print GPLOT "set label \"264 reboots\" at graph 0.4, 0.85\n";
    print GPLOT "set arrow from graph 0.4, 0.85 to graph 0.366, 0.85 lt 7\n";

    print GPLOT "set yrange [0:20]\n";    
    print GPLOT "set xdata time\n";
    print GPLOT "set timefmt \"%s\"\n";
    print GPLOT "set format x \"%d\"\n";
    print GPLOT "set terminal postscript eps enhanced color solid \"Helvetica-18\"\n";
    print GPLOT "set output \"nodeRebootsBinned.eps\"\n";
    my $binSizeMins = $BINSIZE_MSEC / (60.0*1000.0);
    print GPLOT "plot \"$dataFile\" index 0 using 2:3 title \"binSize= $binSizeMins mins\" with impuls\n";

    close(GPLOT);

    return $scriptFile;
}


