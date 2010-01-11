#!/usr/bin/env gnuplot
set term postscript eps enhanced color solid "Helvetica" 18
set output "rate-test.eps"
set yrange [0:105]
set ylabel "Reception ratio(%)"
set xlabel "Offered load (pkts/sec)"
set grid
set ytics 10
set key bottom left
plot "plot.dat" using ($1):(100*$2) ti 'MicaZ' w lp lw 4 pt 13 ps 2,\
     "plot.dat" using ($1):(100*$3) ti 'TmoteSky' w lp lw 4 pt 7 ps 2 
