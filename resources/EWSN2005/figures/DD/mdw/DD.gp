set term postscript eps color solid 14
set output "dd.eps"
set key bottom right
set grid xtics ytics
set xrange [11:17]
set yrange [16:37]

set ytics 2

set label "Voting" at 11.6,33
set label "Data transmission" at 13.4,33

set xlabel 'Time (sec)'
set ylabel 'Current (mA)'

plot "< zcat ../DDpowerconsumpmA.dat.gz" u 1:2 t 'Distributed event detection' w l lt 3 lw 2

