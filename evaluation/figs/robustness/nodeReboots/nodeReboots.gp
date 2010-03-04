set xlabel "Date (August 2005)"
set ylabel "Node ID"
set grid noxtics ytics
set xdata time
set timefmt "%s"
set format x "%d"
set yrange[0:17]
set ytics ("200" 1, "201" 2, "202" 3, "203" 4, "204" 5, "205" 6, "206" 7, "207" 8, "208" 9, "209" 10, "210" 11, "212" 12, "213" 13, "214" 14, "250" 15, "251" 16)
set terminal postscript eps enhanced color solid "Helvetica-18"
set output "nodeReboots.eps"
plot "nodeReboots.dat" index 0 using 4:2 notitle with points pt 6
