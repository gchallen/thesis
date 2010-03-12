#!/usr/bin/perl
use strict;
use Cwd;
use File::Basename;
use regression;


# ======================= Main ==================================
# (1) - Load the event=>node=>picks
my %eventNodePicks;

my @arrivalTimesFiles;
if ($#ARGV >= 0) {
    @arrivalTimesFiles = @ARGV;
}
else {
    @arrivalTimesFiles = getAllArrivalTimesFiles();
}

for (my $i = 0; $i <= $#arrivalTimesFiles; $i++) {
    my %currEventNodePicks = parseArrivalTimesFile($arrivalTimesFiles[$i]);

    foreach my $event ( keys(%currEventNodePicks) ) {
        foreach my $node ( keys(%{$currEventNodePicks{$event}}) ) {
            my $pick = $currEventNodePicks{$event}{$node};
            $eventNodePicks{$event}{$node} = $pick;
            #print "$event ==> $node ==> $pick\n";
        }
    }
}

my %goodEventNodePicks = getGoodEventNodePicks(%eventNodePicks);


# (2) - Generate norma arrivalTime plot
my $gnuplotScriptFile = genGnuplotScript(%goodEventNodePicks);
system("gnuplot < \"$gnuplotScriptFile\"");

# (3) - Generate linear-fit arrivaltTime plot
$gnuplotScriptFile = genGnuplotScriptFit(%goodEventNodePicks);
system("gnuplot < \"$gnuplotScriptFile\"");

# (4) - Generate regression plot
$gnuplotScriptFile = genGnuplotScriptReg(%goodEventNodePicks);
system("gnuplot < \"$gnuplotScriptFile\"");

# (5) - Scattered plot by events
$gnuplotScriptFile = genGnuplotScriptScatteredEvent(%goodEventNodePicks);
system("gnuplot < \"$gnuplotScriptFile\"");

# (6) - Scattered plot by nodeIDs
$gnuplotScriptFile = genGnuplotScriptScatteredNode(%goodEventNodePicks);
system("gnuplot < \"$gnuplotScriptFile\"");


# ======================= Functions ==================================

# @arrivalTimesFiles getAllArrivalTimesFiles
sub getAllArrivalTimesFiles
{
    opendir(DIR,'.') || die "Cannot open . for reading\n";
    my @subdirs = sort(grep { /^2005/ && -d $_ } readdir(DIR));
    closedir(DIR);

    my @arrivalTimesFiles;

    foreach my $dir (@subdirs) {
        push(@arrivalTimesFiles, "${dir}/arrivalTimes.txt");
    }

    return @arrivalTimesFiles;
}

# Returns the %eventNodePicks (hashOfHashes) for the given $fileName
# %eventNodePicks parseArrivalTimesFile($fileName)
sub parseArrivalTimesFile
{
    my ($fileName) = @_;
    my %eventNodePicks;  # HashOfHash event => node => pickTime

    foreach my $line (`cat $fileName`) {
        chomp($line);
        if ($line =~ /^(2005-08.+)\s+(\d+)\s+(\d+.\d+|\d+)\s+(\d+\.\d+|\d+)/) {
            my $event = $1;
            my $node = int($2);
            my $secsFromFirstPick = $3;
            my $secsFrom2005 = $4;
            $eventNodePicks{$event}{$node} = $secsFromFirstPick;
        }
    }

    return %eventNodePicks;
}


# Returns the normalized relative distance of the given node from the reference location
# relDist normRelativeDist($nodeID, @consideredNodes);
sub normRelativeDist
{
    my ($nodeID, @nodesConsidered) = @_;
    
    # (1) - Construct the nodeDists hash from a reference XYZ and the node's XYZ
    my @refXYZ = (873506.117767401, 9990788.3017367, 2760.88392538);
    my %nodeXYZ = (200 => [874886.4924, 9989754.874, 2251.562106],
                   201 => [875125.8316, 9989849.496, 2217.729238],
                   202 => [875509.8876, 9989890.314, 2206.451616],
                   203 => [875075.7372, 9989571.195, 2229.006861],
                   204 => [873506.1178, 9990788.302, 2760.883925],
                   205 => [875463.5039, 9989656.54,  2174.752352],
                   206 => [874418.9463, 9990255.817, 2414.325632],
                   207 => [874671.2728, 9990005.346, 2299.720602],
                   208 => [874129.5129, 9990563.805, 2517.653039],
                   209 => [874524.7008, 9990137.075, 2372.872749],
                   210 => [875559.9816, 9989500.691, 2132.080267],
                   212 => [875166.6491, 9989782.704, 2222.301248],
                   213 => [873836.3688, 9990662.138, 2610.922025],
                   214 => [876112.8735, 9989348.552, 2055.270513],
                   250 => [875049.7625, 9989771.572, 2238.150879],
                   251 => [875771.4904, 9989305.88,  2090.627384]);

    my %nodeDists;

    foreach my $node (keys(%nodeXYZ)) {
        my $xDiff = $nodeXYZ{$node}[0] - $refXYZ[0];
        my $yDiff = $nodeXYZ{$node}[1] - $refXYZ[1];
        my $zDiff = $nodeXYZ{$node}[2] - $refXYZ[2];

        my $dist = sqrt($xDiff*$xDiff + $yDiff*$yDiff + $zDiff*$zDiff);
        $nodeDists{$node} = $dist;
    }

    # (2) - Get the current nodeID's relative distance
    my @nodesSortedByVal = sort {$nodeDists{$a} <=> $nodeDists{$b}} keys(%nodeDists);
    my @nodesConsideredSorted = sort {$nodeDists{$a} <=> $nodeDists{$b}} @nodesConsidered;

    my $nodeIDMinVal = $nodesConsideredSorted[0];
    my $nodeIDMaxVal = $nodesConsideredSorted[$#nodesConsideredSorted];

    my $minVal = $nodeDists{$nodeIDMinVal};
    my $maxVal = $nodeDists{$nodeIDMaxVal};

    return ($nodeDists{$nodeID} - $minVal) / ($maxVal - $minVal);
}


sub getAllNodes
{
    my (%eventNodePicks) = @_;
    my %hashNodes;
    my @arrayNodes;

    # (1) - Store all unique nodes
    foreach my $event ( keys(%eventNodePicks) ) {
        foreach my $node ( keys(%{$eventNodePicks{$event}}) ) {
            $hashNodes{$node} = 1;
        }
    }

    # (2) - Create an array version
    foreach my $nodeKey ( sort(keys(%hashNodes)) ) {
        push(@arrayNodes, $nodeKey);
    }

    return @arrayNodes;
}

sub toIgnore
{
    my ($event, $node) = @_;

    # These event-nodes should be included only
    my %excludeEventNodes = ("2005-08-11_08.33.49" => [203],
                             "2005-08-12_02.15.18" => [203, 202, 205],
                             "2005-08-13_02.17.32" => [204],
                             "2005-08-14_20.17.02" => [204],
                             "2005-08-16_18.30.04" => [203]);

    if (exists($excludeEventNodes{$event})) {

        my @nodesToExclude = @{$excludeEventNodes{$event}};
        foreach my $n (@nodesToExclude) {
            #print "toIgnore: comparing $n\n";
            if ($n == $node) {
                #print "  toIgnore: IGNORING >>$event<< >>$node<<\n";
                return 1;
            }
        }
        #print "  toIgnore: keeping >>$event<< >>$node<<\n";
    }
    
    return 0;
}

sub getGoodEventNodePicks
{
    my (%eventNodePicks) = @_;
    my %goodEventNodePicks;

    foreach my $event ( keys(%eventNodePicks) ) {
        # (1) - Find out the node with the smallest time
        my $minGoodPick = 99999.9; # pick a really big number
        #my $nodeWithMinGoodPick = 200;
        foreach my $node ( keys(%{$eventNodePicks{$event}}) ) {
            if (!toIgnore($event, $node)) {
                my $pick = $eventNodePicks{$event}{$node};
                if ($pick < $minGoodPick) {
                    $minGoodPick = $pick;
                    #$nodeWithMinGoodPick = $node;
                }                
            }
        }

        # (2) - Construct the goodEventNodePicks with the minGoodPick offset
        foreach my $node ( keys(%{$eventNodePicks{$event}}) ) {
            if (!toIgnore($event, $node)) {
                $goodEventNodePicks{$event}{$node} = $eventNodePicks{$event}{$node} - $minGoodPick;
            }
        }
    }

    return %goodEventNodePicks;
}


# Generates a gnuplot script for the given eventNodePicks (hashOfHashes)
# scriptFileName genGnuplotScript(%eventNodePicks);
sub genGnuplotScript
{
    my (%eventNodePicks) = @_;

    # (1) - Get an array of all nodes.  We need all nodes to properly normalize
    #       the distances.
    my @allNodes = getAllNodes(%eventNodePicks);

    my $scriptFile = "arrivalTimesPlot.gp";
    my $dataFile = "arrivalTimesPlot.dat";
    open(GPLOT, ">$scriptFile") || die "$scriptFile\n";
    open(GDATA, ">$dataFile") || die "$dataFile\n";


    # (2) - Generate the files
    #print GPLOT "set title \"Arrival Times\"\n";
    print GPLOT "set xlabel \"Node ID (by normalized distance)\"\n";
    print GPLOT "set ylabel \"Time of arrival (seconds)\"\n";
    print GPLOT "set grid\n";
    #print GPLOT "set xrange[0:]\n";
    print GPLOT "set yrange[-.025:]\n";
    print GPLOT "set terminal postscript eps enhanced color solid \"Helvetica-18\"\n";
    print GPLOT "set output \"arrivalTimesPlot.eps\"\n";
 
    # format looks like this:  set ytics ("213" 0, "208" 1, "206" 2)
    # the xtics
    for (my $i; $i <= $#allNodes; $i++) {
        if ($i == 0) {print GPLOT "set xtics (";}
        else         {print GPLOT ", ";}
        my $distOffset = normRelativeDist($allNodes[$i], @allNodes);
        if ($allNodes[$i] == 201 || $allNodes[$i] == 203 || $allNodes[$i] == 205) {
            print GPLOT "\"\\n$allNodes[$i]\" $distOffset";
        }
        else {
            print GPLOT "\"$allNodes[$i]\" $distOffset";
        }
    }
    print GPLOT ")\n";

    # the plot
    my $eventIndex = 0;
    foreach my $event ( sort(keys(%eventNodePicks)) ) {
        # a) The data file
        print GDATA "\n\n#event= $event\n";
        print GDATA "#<nodeID> <normDist> <pickTime>\n";
        my @nodeKeys = ( keys(%{$eventNodePicks{$event}}) );
        my @nodeKeysDistSorted = sort {normRelativeDist($a, @allNodes) <=> normRelativeDist($b, @allNodes)} @nodeKeys;
        foreach my $node ( @nodeKeysDistSorted ) {
            my $normDist = normRelativeDist($node, @allNodes);
            my $pick = $eventNodePicks{$event}{$node};
            print GDATA "$node $normDist $pick\n";            
        }

        # b) The script file
        if ($eventIndex == 0) { print GPLOT "\nplot "; }
        else                  { print GPLOT ", \\\n     "; }
        my $eventStr = $event;
        $eventStr =~ s/_/\\\\_/;  # in gnuplot "_" must be escaped
        print GPLOT "\"$dataFile\" index $eventIndex using 2:3 title \"$eventStr\" with linespoints";
        $eventIndex++;
    }

    print GPLOT "\n";
    close(GPLOT);
    close(GDATA);

    return $scriptFile;
}


# Generates a gnuplot script for the given eventNodePicks (hashOfHashes)
# scriptFileName genGnuplotScript(%eventNodePicks);
sub genGnuplotScriptFit
{
    my (%eventNodePicks) = @_;

    # (1) - Get an array of all nodes.  We need all nodes to properly normalize
    #       the distances.
    my @allNodes = getAllNodes(%eventNodePicks);

    my $scriptFile = "arrivalTimesPlotFit.gp";
    my $dataFile = "arrivalTimesPlotFit.dat";
    open(GPLOT, ">$scriptFile") || die "$scriptFile\n";
    open(GDATA, ">$dataFile") || die "$dataFile\n";


    # (2) - Generate the files
    #print GPLOT "set title \"Arrival Times\"\n";
    print GPLOT "set xlabel \"Node ID (by normalized distance)\"\n";
    print GPLOT "set ylabel \"Time of arrival (seconds)\"\n";
    print GPLOT "set grid\n";
    #print GPLOT "set xrange[0:]\n";
    #print GPLOT "set yrange[-.025:]\n";
    print GPLOT "set terminal postscript eps enhanced color solid \"Helvetica-18\"\n";
    print GPLOT "set output \"arrivalTimesPlotFit.eps\"\n";
 
    # format looks like this:  set ytics ("213" 0, "208" 1, "206" 2)
    # the xtics
    for (my $i; $i <= $#allNodes; $i++) {
        if ($i == 0) {print GPLOT "set xtics (";}
        else         {print GPLOT ", ";}
        my $distOffset = normRelativeDist($allNodes[$i], @allNodes);
        if ($allNodes[$i] == 201 || $allNodes[$i] == 203 || $allNodes[$i] == 205) {
            print GPLOT "\"\\n$allNodes[$i]\" $distOffset";
        }
        else {
            print GPLOT "\"$allNodes[$i]\" $distOffset";
        }
    }
    print GPLOT ")\n";

    my @plotLines;

    # the plot
    my $eventIndex = 0;
    foreach my $event ( sort(keys(%eventNodePicks)) ) {
        # a) The data file
        print GDATA "\n\n#event= $event\n";
        print GDATA "#<nodeID> <normDist> <pickTime>\n";
        my @nodeKeys = ( keys(%{$eventNodePicks{$event}}) );
        my @nodeKeysDistSorted = sort {normRelativeDist($a, @allNodes) <=> normRelativeDist($b, @allNodes)} @nodeKeys;
        my $pickReverseMult = 1.0;  # mirrors to transform a V shape into a line

        foreach my $node ( @nodeKeysDistSorted ) {
            my $normDist = normRelativeDist($node, @allNodes);
            my $origPick = $eventNodePicks{$event}{$node};
            if ($origPick == 0) {
                $pickReverseMult = -1.0;
            }
            my $adjPick = $origPick * $pickReverseMult;
            print GDATA "$node $normDist $adjPick\n";
        }

        # b) The script file
        if ($eventIndex == 0) { push(@plotLines, "\nplot "); }
        else                  { push(@plotLines, ", \\\n     "); }
        my $eventStr = $event;
        $eventStr =~ s/_/\\\\_/;  # in gnuplot "_" must be escaped
        my $line = "\"$dataFile\" index $eventIndex using 2:3 title \"$eventStr\" with points lt $eventIndex, \\\n" .
                   "     f$eventIndex(x) title \"$eventStr\" lt $eventIndex";
        
        push(@plotLines, $line);
        $eventIndex++;
    }

    print GPLOT "\n";
    for (my $i = 0; $i <= $#plotLines; $i++) {
        print GPLOT "f$i(x) = a$i*x + b$i \n";   #$plotLines[$i];
        print GPLOT "fit f$i(x) \"$dataFile\" index $i using 2:3 via a$i,b$i \n";
    }

    print GPLOT "\n";
    for (my $i = 0; $i <= $#plotLines; $i++) {
        print GPLOT $plotLines[$i];
    }

    print GPLOT "\n";
    close(GPLOT);
    close(GDATA);

    return $scriptFile;
}


# Generates a gnuplot script for the given eventNodePicks (hashOfHashes)
# scriptFileName genGnuplotScript(%eventNodePicks);
sub genGnuplotScriptReg
{
    my (%eventNodePicks) = @_;

    # (1) - Get an array of all nodes.  We need all nodes to properly normalize
    #       the distances.
    my @allNodes = getAllNodes(%eventNodePicks);
    my @eventsSorted = sort(keys(%eventNodePicks));

    my $scriptFile = "arrivalTimesPlotReg.gp";
    my $dataFile = "arrivalTimesPlotReg.dat";
    open(GPLOT, ">$scriptFile") || die "$scriptFile\n";
    open(GDATA, ">$dataFile") || die "$dataFile\n";


    # (2) - Generate the files
    #print GPLOT "set title \"Arrival Times\"\n";
    print GPLOT "set xlabel \"Coefficient of determination (R^{2})\"\n";
    print GPLOT "set ylabel \"Event\"\n";
    print GPLOT "set grid\n";
    print GPLOT "set xrange[-0.05:1.05]\n";
    print GPLOT "set yrange[-1:" . ($#eventsSorted+1) . "]\n";
    print GPLOT "set terminal postscript eps enhanced color solid \"Helvetica-18\"\n";
    print GPLOT "set output \"arrivalTimesPlotReg.eps\"\n";
 
    # format looks like this:  set ytics ("213" 0, "208" 1, "206" 2)
    # the ytics
    for (my $i; $i <= $#eventsSorted; $i++) {
        if ($i == 0) {print GPLOT "set ytics (";}
        else         {print GPLOT ", ";}
        my $eventStr = $eventsSorted[$i];
        $eventStr =~ s/_/\\\\_/;  # in gnuplot "_" must be escaped
        print GPLOT "\"$eventStr\"" . int($i);
    }
    print GPLOT ")\n";

    # the plot
    print GDATA "#<event> <eventIndex> <R> <R^2>\n";
    my $eventIndex = 0;
    foreach my $event (@eventsSorted) {
        # a) The data file
        my @nodeKeys = ( keys(%{$eventNodePicks{$event}}) );
        my @nodeKeysDistSorted = sort {normRelativeDist($a, @allNodes) <=> normRelativeDist($b, @allNodes)} @nodeKeys;
        my $pickReverseMult = 1.0;  # mirrors to transform a V shape into a line
        my @xyData;

        foreach my $node ( @nodeKeysDistSorted ) {
            my $normDist = normRelativeDist($node, @allNodes);
            my $origPick = $eventNodePicks{$event}{$node};
            if ($origPick == 0) {
                $pickReverseMult = -1.0;
            }
            my $adjPick = $origPick * $pickReverseMult;

            my $val = {
                x => $normDist,
                y => $adjPick,
            };          
            push(@xyData, $val);            
        }

        my $r =  regression::getR(@xyData);
        my $rr = ($r*$r);
        my $regSumm = "$event $eventIndex $r $rr";
        print "====> $regSumm \n";
        print GDATA "$regSumm \n";
        $eventIndex++;
    }

    print GPLOT "plot \"$dataFile\" using 4:2 notitle with points pt 1 lt 1 lw 3\n";
    close(GPLOT);
    close(GDATA);

    return $scriptFile;
}


# scriptFileName genGnuplotScript(%eventNodePicks);
sub genGnuplotScriptScatteredEvent
{
    my (%eventNodePicks) = @_;
    my @eventsSorted = sort(keys(%eventNodePicks));
    my $refNode = 207;

    my $baseFileName = "arrivalTimesPlotScatteredEvent";
    my $scriptFile = "${baseFileName}.gp";
    my $dataFile = "${baseFileName}.dat";
    open(GPLOT, ">$scriptFile") || die "$scriptFile\n";
    open(GDATA, ">$dataFile") || die "$dataFile\n";


    # (2) - Generate the files
    print GPLOT "set xlabel \"Time of arrival, relative to nodeID= $refNode  (seconds)\"\n";
    print GPLOT "set ylabel \"Event\"\n";
    print GPLOT "set grid\n";
    print GPLOT "set xrange[-1:1]\n";
    print GPLOT "set yrange[-1:" . ($#eventsSorted+1) . "]\n";
    print GPLOT "set terminal postscript eps enhanced color solid \"Helvetica-18\"\n";
    print GPLOT "set output \"${baseFileName}.eps\"\n";
 
    # format looks like this:  set ytics ("213" 0, "208" 1, "206" 2)
    # the ytics
    for (my $i; $i <= $#eventsSorted; $i++) {
        if ($i == 0) {print GPLOT "set ytics (";}
        else         {print GPLOT ", ";}
        my $eventStr = $eventsSorted[$i];
        $eventStr =~ s/_/\\\\_/;  # in gnuplot "_" must be escaped
        print GPLOT "\"$eventStr\"" . int($i);
    }
    print GPLOT ")\n";

    # the plot
    my $eventIndex = 0;
    foreach my $event (@eventsSorted) {
        # (a) The data file
        print GDATA "\n\n#event= $event\n";
        print GDATA "#<eventIndex> <nodeID> <pickTimeFromReferenceNode>\n";

        # get the arrival time for the referenceNode
        my $refNodePick = -1000;
        foreach my $node ( keys(%{$eventNodePicks{$event}}) ) {
            if ($node == $refNode) {
                $refNodePick = $eventNodePicks{$event}{$node};
            }
        }
        # sanity check
        if ($refNodePick == -1000) {
            print "EXITING! event= $event doesn't have nodeID= $refNode\n";
            exit();
        }

        foreach my $node ( keys(%{$eventNodePicks{$event}}) ) {
            my $pick = $eventNodePicks{$event}{$node} - $refNodePick;
            print GDATA "$eventIndex $node $pick\n";            
        }

        # b) The script file
        # the plot command
        if ($eventIndex == 0) { print GPLOT "\nplot "; }
        else                  { print GPLOT ", \\\n     "; }
        print GPLOT "\"$dataFile\" index " . int($eventIndex) . " using 3:1 notitle with points pt 1 lt 1 lw 3";

        $eventIndex++;
    }

    print GPLOT "\n";
    close(GPLOT);
    close(GDATA);

    return $scriptFile;
}


# scriptFileName genGnuplotScript(%eventNodePicks);
sub genGnuplotScriptScatteredNode
{
    my (%eventNodePicks) = @_;
    my @eventsSorted = sort(keys(%eventNodePicks));
    my $refNode = 207;

    # (1) - Get an array of all nodes.  We need all nodes to properly normalize
    #       the distances.
    my @allNodes = getAllNodes(%eventNodePicks);


    my $baseFileName = "arrivalTimesPlotScatteredNode";
    my $scriptFile = "${baseFileName}.gp";
    my $dataFile = "${baseFileName}.dat";
    open(GPLOT, ">$scriptFile") || die "$scriptFile\n";
    open(GDATA, ">$dataFile") || die "$dataFile\n";


    # (2) - Generate the files
    print GPLOT "set xlabel \"Time of arrival, relative to nodeID= $refNode (seconds)\"\n";
    print GPLOT "set ylabel \"Node ID \\n(by normalized distance from node 204)\"\n";
    print GPLOT "set grid\n";
    print GPLOT "set xrange[-1:1]\n";
    print GPLOT "set yrange[-0.05:1.055]\n";
    print GPLOT "set terminal postscript eps enhanced color solid \"Helvetica-18\"\n";
    print GPLOT "set output \"${baseFileName}.eps\"\n";
 
    # format looks like this:  set ytics ("213" 0, "208" 1, "206" 2)
    # the ytics
    for (my $i; $i <= $#allNodes; $i++) {
        if ($i == 0) {print GPLOT "set ytics (";}
        else         {print GPLOT ", ";}
        my $distOffset = normRelativeDist($allNodes[$i], @allNodes);
        if ($allNodes[$i] == 201 || $allNodes[$i] == 203 || $allNodes[$i] == 205) {
            print GPLOT "\"$allNodes[$i]      \" $distOffset";
        }
        else {
            print GPLOT "\"$allNodes[$i]\" $distOffset";
        }
    }
    print GPLOT ")\n";

    # the plot
    print GDATA "#pickReferenceNodeID= $refNode\n";
    print GDATA "#<event> <nodeID> <normDist> <pickTimeFromReferenceNode>\n";
    foreach my $event (@eventsSorted) {
        # (a) The data file
        # get the arrival time for the referenceNode
        my $refNodePick = -1000;
        foreach my $node ( keys(%{$eventNodePicks{$event}}) ) {
            if ($node == $refNode) {
                $refNodePick = $eventNodePicks{$event}{$node};
            }
        }
        # sanity check
        if ($refNodePick == -1000) {
            print "EXITING! event= $event doesn't have nodeID= $refNode\n";
            exit();
        }

        foreach my $node ( keys(%{$eventNodePicks{$event}}) ) {
            my $normDist = normRelativeDist($node, @allNodes);
            my $pick = $eventNodePicks{$event}{$node} - $refNodePick;
            print GDATA "$event $node $normDist $pick\n";            
        }
    }
    print GPLOT "plot \"$dataFile\" using 4:3 notitle with points pt 1 lt 1 lw 3";

    print GPLOT "\n";
    close(GPLOT);
    close(GDATA);

    return $scriptFile;
}

