#!/usr/bin/gnuplot -persist
set term postscript color eps enhanced "Helvetica" 18
set output "linkquality.eps"
set title "Link Quality"
set xlabel 'links'
set ylabel 'number of transmissions'
set y2label 'reception ratio (%)'
set y2tics 10
set grid
set key left
plot 'plot.dat' u 0:($7) axis x1y2 w linesp lw 2 title 'motelab', \
     'plot.dat' u 0:6 w linesp lw 2 t 'stdev', \
     'plot.dat' u 0:2 w linesp lw 2 t 'mean', \
     'plot.dat' u 0:3 w linesp lw 2 t 'median', \
     'plot.dat' u 0:4 w linesp lw 2 t 'min', \
     'plot.dat' u 0:5 w linesp lw 2 t 'max'
