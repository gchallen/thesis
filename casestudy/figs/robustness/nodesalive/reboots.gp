# This gnuplot script file was automatically generate by Gnuplot.java
set xlabel "Day"
set ylabel "Node ID"
set grid noxtics ytics
set size 0.7, 0.7
set key top left Left reverse
#set xtics 0,1 
#set mxtics 4

set yrange[198:217] 
set ytics 0,1 
set ytics ("200" 200, "201" 201, "202" 202, "203" 203, "204" 204, "205" 205, "206" 206, "207" 207, "208" 208, "209" 209, "210" 210,  "212" 211, "213" 212, "214" 213, "250" 214, "251" 215)
set terminal postscript eps 10 enhanced color solid "Helvetica"
set output "reboots.eps"

set xdata time
set timefmt "%s"
set format x "%m/%d"

set xrange [1122600000:]

plot "reboots.dat" u ($3):1 t 'Node reboot' w p ps 1.0 lt 3 lw 1 pt 7, \
     "reprograms.dat" u ($1):2 t 'Node reprogrammed' w p ps 1.0 lt 1 lw 1 pt 7

