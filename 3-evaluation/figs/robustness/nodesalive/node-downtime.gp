set xlabel "Node ID"
set ylabel "Node downtime"
set grid noxtics ytics
set size 0.7, 0.7
set key top left Left
set xtics ("200" 200, "201" 201, "202" 202, "203" 203, "204" 204, "205" 205, "206" 206, "207" 207, "208" 208, "209" 209, "210" 210, "212" 211, "213" 212, "214" 213, "250" 214, "251" 215)
set xrange [199:216]
set ytics 10
set yrange [0:100]
set format y "%0.0f%%"

set terminal postscript eps 10 enhanced color solid "Helvetica"
set output "node-downtime.eps"

plot "node-downtime.dat" u 2:5 title 'Base station failures' w i lt 1 lw 20, \
     "node-downtime.dat" u 2:7 title 'Deluge failure' w i lt 3 lw 20, \
     "node-downtime.dat" u 2:9 title 'Node downtime' w i lt 4 lw 20

