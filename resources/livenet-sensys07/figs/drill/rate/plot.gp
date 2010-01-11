#!/usr/bin/gnuplot -persist
set term postscript eps enhanced color "Helvetica" 18
set output "plot.eps"
set size 2,1
set xrange [7800:11100]
set key left
set y2label ""
set xlabel "Time"
#set x2label "time"
#set xtics 300
set xtics ("10:00:00" 7200, "10:05:00" 7500, "10:10:00" 7800, "10:15:00" 8100, \
"10:20:00" 8400, "10:25:00" 8700, "10:30:00" 9000, "10:35:00" 9300, "10:40:00" 9600,\
 "10:45:00" 9900, "10:50:00" 10200, "10:55:00" 10500, "11:00:00" 10800, "11:05:00" 11100,\
  "11:10:00" 11400, "11:15:00" 11700, "11:30:00" 12600)
set ylabel "Traffic rate (kbits/sec)"
plot "plot-30.dat" using 1:(($6)/1000) ti "query / status" with l lw 4 lt 2, \
     "plot-30.dat" using 1:(($5)/1000) ti "query reply" with l lw 4 lt 1,\
     "plot-30.dat" using 1:(($7+$8+$9)/1000) ti "route maintenance" with l lt 3 lw 4, \
     "plot-30.dat" using 1:($4/1000) ti "corrupted packets" with l lt 4 lw 4, \
     "plot-30.dat" using 1:(($4+$5+$6+$7+$8+$9)/1000) ti "all packets" with l lt 5 lw 4

#set arrow from 9400, 10 to 9500, 0 lt -1
