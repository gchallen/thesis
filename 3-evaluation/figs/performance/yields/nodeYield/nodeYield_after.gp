# This gnuplot script file was automatically generate by Gnuplot.java
set xlabel "Node ID"
set ylabel "Node block yield (%)"
set y2label "Nbr of blocks (x*10,000)" 
set grid
set xrange[-0.5:15.5]

set yrange[0:100]
set y2range[0:]
set y2tics 0,1

set key top right 
set boxwidth 0.25 relative 
set style fill pattern 7
 
set xtics ("206" 0, "200" 1, "207" 2, "212" 3, "204" 4, "202" 5, "201" 6, "203" 7, "205" 8, "208" 9, "209" 10, "210" 11, "214" 12, "213" 13, "251" 14, "250" 15)
set terminal postscript eps enhanced color solid "Helvetica" 18
set output "nodeYield_after.eps"

plot "nodeYield_after.dat" index 0 using ($1-0.13):($4*100) axes x1y1 title "node block yield"  with boxes lt 1 lw 4, \
     "nodeYield_after.dat" index 0 using ($1+0.13):($2/10000) axes x1y2 title "scheduled"  with boxes lt 2 lw 4, \
     "nodeYield_after.dat" index 0 using ($1+0.13):($3/10000) axes x1y2 title "downloaded"  with boxes lt 3 lw 4