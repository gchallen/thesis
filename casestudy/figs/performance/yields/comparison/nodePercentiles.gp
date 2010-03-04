# This gnuplot script file was automatically generate by Gnuplot.java
set xlabel "Node ID"
set ylabel "Yield (%)"
set grid
set key top right 
set xrange[-0.5:15.5]
set xtics ("200" 0, "201" 1, "202" 2, "203" 3, "204" 4, "205" 5, "206" 6, "207" 7, "208" 8, "209" 9, "210" 10,  "212" 11, "213" 12, "214" 13, "250" 14, "251" 15)
set yrange[0:115] 
set boxwidth 0.25 relative 
#set style fill pattern 7
set terminal postscript eps enhanced color solid "Helvetica" 18
set output "nodePercentiles.eps"

#plot "nodePercentiles.dat" index 0 using 2:4 title "P[X <= 0.50]"  with boxes lt 1 lw 1

plot "nodePercentiles_before.dat" using ($2-0.125):4 title "before reprogramming P[X <= 0.50]" with boxes lt 1 lw 1 fill pattern 2, \
     "nodePercentiles_after.dat"  using ($2+0.125):4 title "after reprogramming P[X <= 0.50]"  with boxes lt 3 lw 1 fill pattern 3
