set xlabel 'Sequence number'
set ylabel 'Sample data'

set size 1,0.5
set grid noxtics ytics
set key top right

set term postscript eps color dashed 20
set output "data-smooth.eps"

#plot [2100:2650] "mote2.out" u 6 t 'Smoothed data' w l lw 2
plot [2200:2350][490:560] "mote2.out" u 6 t 'Smoothed data' w l lw 2
