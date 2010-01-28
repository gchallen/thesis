set xlabel "Node ID"
set ylabel "Node downtime"
set grid noxtics ytics
set size 0.7, 0.7
set key below
set xtics ("200" 200, "201" 201, "202" 202, "203" 203, "204" 204, "205" 205, "206" 206, "207" 207, "208" 208, "209" 209, "210" 210, "212" 211, "213" 212, "214" 213, "250" 214, "251" 215)
set xrange [199:216]
set ytics 10
set yrange [0:100]
set format y "%0.0f%%"
set style fill pattern 4
set boxwidth 0.7

set terminal postscript eps 10 enhanced color solid "Helvetica"
set output "node-uptime2.eps"

plot \
     "node-downtime.dat" u ($2):(100.0-$9) title 'Node uptime' w boxes lt 4 lw 3, \
     "node-downtime.dat" u ($2):(100.0-$7) title 'with Deluge failure' w boxes lt 3 lw 3, \
     "node-downtime.dat" u ($2):(100.0-$5) title 'with base failures' w boxes lt 1 lw 3

