#!/usr/bin/perl -w

if($#ARGV ==  -1)
{
    print("USAGE: table.pl filename\n");
    exit;
}

@large = ();
@dworst = ();
@fifo = ();
@dnew = ();


gatherStats($ARGV[0]);
$dat   = "table.dat";
printstats();

$res    = "\"table.eps\"";
$ylabel = "\"Delivery Ratio\"";
$xlabel = "\"Sender-Receiver Pair\"";
#$yrange = $max + 20; 

#compute xtics
$xtics  = "(";
$start  = 0.43;
$width  = 0.25;
$space  = 0.10;
for ($i = 1; $i <= ($#large + 1); ++$i) {
    $xtics = $xtics." \"".$i."\" ".$start.",";
    $start = $start + $width*4+$space;
}
chop($xtics);
$xtics = $xtics.")";



$output = "|gnuplot";
open (GNUPLOT, $output);
print GNUPLOT "set terminal postscript eps enhanced 'Helvetica' 18;\n";
#print GNUPLOT "set key left;\n";
print GNUPLOT "set offsets 0.2,0.2;\n";
print GNUPLOT "set xlabel $xlabel ;\n";
print GNUPLOT "set ylabel $ylabel;\n";
print GNUPLOT "set ytics 10;\n";
print GNUPLOT "set grid ytics noxtics;\n";
#print GNUPLOT "set xtics (\"1 Hop\" 0.18, \"3 Hop\" 0.78, \"5 Hop\" 1.38);\n";
print GNUPLOT "set xtics $xtics font \"timesbold,14\";\n";
print GNUPLOT "set output $res;\n";
#print GNUPLOT "set xrange [0:2];\n";
#print GNUPLOT "set yrange [0:$yrange];\n";
#print GNUPLOT "set x2range [0:2];\n";
print GNUPLOT "plot \"$dat\" index 0 title \"Large Table\" with boxes fill pattern 0 border 1 lt -1, \"$dat\" index 1 title \"Drop Worst\" with boxes fill pattern 1 border 1 lt -1, \"$dat\" index 2 title \"FIFO\" with boxes fill pattern 3 border 1 lt -1, \"$dat\" index 3 title \"Drop New\" with boxes fill pattern 4 border 1 lt -1;\n";
close(GNUPLOT);


sub gatherStats{
    open(FILE, $_[0]);
    while ($line = <FILE>)
    {
	chomp($line);
	@arr = split(/,/, $line);
	$large[$#large + 1] = $arr[1];
	$dworst[$#dworst + 1] = $arr[2];
	$fifo[$#fifo + 1] = $arr[3];
	$dnew[$#dnew + 1] = $arr[4];
    }
    close (FILE);
}

sub printstats{

    $width = 0.25; # width of bar
    $space = 0.10; # space between bars
    $tmp   = ">table.dat";
    $start = $pos = 0.05;
    open (DAT, $tmp);
  
    for ($i = 0; $i < $#large; ++$i) {
	print DAT "$pos \t $large[$i] \t $width\n";
	$pos = $width*4 + $space + $pos;
    }
    print DAT "\n\n";

    $pos = $start + $width;
    for ($i = 0; $i < $#dworst; ++$i) {
	print DAT "$pos \t $dworst[$i] \t $width\n";
	$pos = $width*4 + $space + $pos;
    }
    print DAT "\n\n";

    $pos = $start + $width*2;
    for ($i = 0; $i < $#fifo; ++$i) {
	print DAT "$pos \t $fifo[$i] \t $width\n";
	$pos = $width*4 + $space + $pos;
    }
    print DAT "\n\n";

    $pos = $start + $width*3;
    for ($i = 0; $i < $#dnew; ++$i) {
	print DAT "$pos \t $dnew[$i] \t $width\n";
	$pos = $width*4 + $space + $pos;
    }

    close (DAT);
}

