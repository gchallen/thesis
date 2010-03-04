set term postscript eps color dashed 14
set output "explosion.eps"
set key top right
set grid xtics noytics
#set xtics 1
set xtics font "Helvetica,10"
set ylabel 0.1
#set ytics 10000
set ytics rotate 0,1024,1024 font "Helvetica,10"
set yrange [0:1024]
set xrange [126663:126680]

set size 1,1.5

set multiplot

#set title 'July 21 2004 11:11:00 GMT' font "HelveticaBold,10"
set noxlabel
set size 1,0.3
set origin 0,1.2
plot "data/mote2.out" u 1:4 t 'Mote #2' w l lw 2

set notitle
set noxlabel
set size 1,0.3
set origin 0,0.9
plot "data/mote3.out" u 1:4 t 'Mote #3' w l lw 2

set noxlabel
set size 1,0.3
set origin 0,0.6
plot "data/mote4.out" u 1:4 t 'Mote #4' w l lw 2

set ytics rotate 0.3439,-1.2648,-0.9209
set yrange [0.3439:-0.9209]

set noxlabel
set size 1,0.3
set origin 0,0.3
plot "data/channel0.out" u 1:2 t 'Wired infrasound' w l lw 2

set ytics rotate -0.26,0.13,-0.13
set yrange [-0.26:-0.13]

set xlabel 'Time, sec' font "Helvetica,10"
set size 1,0.3
set origin 0,0
plot "data/channel4.out" u 1:2 t 'Wired seismic' w l lw 2

set nomultiplot
