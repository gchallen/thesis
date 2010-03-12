set xlabel "Time of arrival, relative to node 207 (seconds)"
set ylabel "Node ID (by distance from node 207)" 2,0
set grid
set yrange [-1900:1900]
set xrange[-1:1]

set ytics ("200" 333.728841644863, "201      " 487.478726641978, "202" 851.590422417271, "203      " 597.560854503532, "204" -1477.59192013185, "205      " 874.592936715384, "206" -373.548788438776, "207" 0, "208" -808.006677586622, "209" -210.207319652067, "210" 1035.65596707719, "212" 548.599029474061, "213" -1106.9267121885, "214" 1602.91820835955, "250" 449.105295974588, "251" 1320.39820748111)

set terminal postscript eps enhanced color "Helvetica" 18
set output "arrivalTimesPlotScatteredNode.eps"

plot ( x*1500) notitle with filledcurve y1=0 lt 9, \
     (-x*1500) notitle with filledcurve y1=0 lt 9, \
     "arrivalTimesPlotScatteredNode.dat" using 4:3 notitle with points pt 1 ps 2 lt 1 lw 4
   
