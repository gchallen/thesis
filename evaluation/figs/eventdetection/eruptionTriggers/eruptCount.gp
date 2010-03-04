# This gnuplot script file was automatically generate by Gnuplot.java
set xlabel "Node ID"
set ylabel "Total number of eruption triggers"
set grid noxtics ytics
set size 0.7, 0.7
set key top right 
set xtics ("200" 200, "201" 201, "202" 202, "203" 203, "204" 204, "205" 205, "206" 206, "207" 207, "208" 208, "209" 209, "210" 210, "212" 211, "213" 212, "214" 213, "250" 214, "251" 215, "Global" 216)
set xrange [199:217]

set terminal postscript eps 10 enhanced color solid "Helvetica"
set output "eruptCount.eps"

plot "eruptCount.dat" index 0 u 2:4 title "Trigger count" w i lt 3 lw 20, \
     "eruptCount.dat" index 1 u 2:4 t '' w i lt 1 lw 20
