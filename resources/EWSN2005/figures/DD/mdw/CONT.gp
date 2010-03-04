set term postscript eps color solid 14
set output "continuous.eps"
set key bottom right
set grid xtics ytics
set xrange [0:4]
set yrange [16:37]

set xtics 1
set ytics 2

set xlabel 'Time (sec)'
set ylabel 'Current (mA)'

plot "< zcat ../CONTpowerconsumpmA.dat.gz" u 1:2 t 'Continuous transmission' w l lt 3 lw 2

