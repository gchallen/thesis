package regression;
use strict;
use Cwd;
use File::Basename;


# ======================= Main ==================================
# # (1) - Parse the input file
# my @xyData = parseDataFile("data.dat");
# my @xData;
# my @yData;

# foreach my $val (@xyData) {
#     print "$val->{x} $val->{y}\n";
#     push(@xData, $val->{x});
#     push(@yData, $val->{y});
# }

# for (my $i = 0; $i <= $#xData; $i++) {
#     print "==> $xData[$i] $yData[$i]\n";
# }


# print "sumX= " . sum(@xData) . " sumY= " . sum(@yData) . "\n";
# print "sumOfProd= " . sumProd(@xyData) . "\n";
# print "sumOfSqrsX= " . sumSqrs(@xData) . "\n";
# print "sumOfSqrsY= " . sumSqrs(@yData) . "\n";
# my ($mm, $bb) = getMB(@xyData);
# print "===> mb $mm $bb\n";
# my $rr = getR(@xyData);
# print "===> r $rr \n";

# ======================= Functions ==================================
sub getR
{
    my (@xyData) = @_;
    my @xData = getXData(@xyData);
    my @yData = getYData(@xyData);
    my $n = $#xyData + 1;

    my $num = $n * sumProd(@xyData) - (sum(@xData) * sum(@yData));
    my $denomX = sqrt( ($n * sumSqrs(@xData)) - (sum(@xData) * sum(@xData)) );
    my $denomY = sqrt( ($n * sumSqrs(@yData)) - (sum(@yData) * sum(@yData)) );
    my $r = $num / ($denomX * $denomY);
    #print "r= $r, r^2= " . ($r * $r) . "\n";
    return $r;
}

sub getMB
{
    my (@xyData) = @_;
    my @xData = getXData(@xyData);
    my @yData = getYData(@xyData);
    my $n = $#xyData + 1;

    my $top = $n * sumProd(@xyData) - (sum(@xData) * sum(@yData));
    my $bottom = $n * sumSqrs(@xData) - (sum(@xData) * sum(@xData));
    my $m = $top/$bottom;

    my $b = (sum(@yData) - $m * sum(@xData)) / $n;

    #print "topbottom $top $bottom\n";
    #print "m= $m b= $b\n";
    return ($m, $b);
}


sub sum
{
    my (@data) = @_;

    my $sum = int(0);
    foreach my $val (@data) {
        $sum += $val;
    }
    return $sum;
}

sub sumProd
{
    my (@xyData) = @_;

    my $sum = int(0);
    foreach my $xyVal (@xyData) {
        $sum += $xyVal->{x} * $xyVal->{y};
    }
    return $sum;
}

sub sumSqrs
{
    my (@data) = @_;

    my $sum = int(0);
    foreach my $val (@data) {
        $sum += $val * $val;
    }
    return $sum;
}

sub getXData
{
    my (@xyData) = @_;
    my @xData;
    foreach my $val (@xyData) {
        push(@xData, $val->{x});
    }
    return @xData;
}

sub getYData
{
    my (@xyData) = @_;
    my @yData;
    foreach my $val (@xyData) {
        push(@yData, $val->{y});
    }
    return @yData;
}

# Returns the %eventNodePicks (hashOfHashes) for the given $fileName
# %eventNodePicks parseArrivalTimesFile($fileName)
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

return 1;
