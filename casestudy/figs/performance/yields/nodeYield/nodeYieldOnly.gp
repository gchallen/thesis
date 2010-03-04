set xlabel "Node ID"
set ylabel "Node yield (%)"
#set y2label "Nbr of times" 
set grid y
set xrange[-0.5:15.5]

set yrange[0:100]
set ytics 0,10
#set y2range[0:300]
#set y2tics 0,60

set key top right 
set boxwidth 0.5 relative 
set style fill pattern 3

set xtics ("206" 0, "201" 1, "207" 2, "200" 3, "202" 4, "203" 5, "212" 6, "205" 7, "204" 8, "209" 9, "210" 10, "250" 11, "208" 12, "213" 13, "214" 14, "251" 15)

set terminal postscript eps enhanced color solid "Helvetica" 18
set output "nodeYield.eps"

# plot "nodeYield.dat" index 0 using 1:5 axes x1y1 title "node yield"  with boxes lt 1 lw 3, \
#      "nodeYield.dat" index 0 using ($1+0.13):7 axes x1y2 title "available"  with boxes lt 2 lw 3, \
#      "nodeYield.dat" index 0 using ($1+0.13):9 axes x1y2 title "downloaded"  with boxes lt 3 lw 3

plot "nodeYield.dat" index 0 using 1:5 axes x1y1 notitle with boxes

