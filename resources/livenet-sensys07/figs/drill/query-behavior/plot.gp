#!/usr/bin/gnuplot -persist
set term postscript eps color enhanced 'Helvetica' 18
set output "plot.eps"
#set title "Data Loss Disambiguation"
#set title "TITLE"
set ylabel "Query Reply Packet Sequence Number"
set xlabel "Time(s)"
#set xrange [8000:11000]
set xrange [8300:8800]
set xtics ( "10:19" 8340, "10:20" 8400, "10:21" 8460, "10:22" 8520, \
"10:23" 8580, "10:24" 8640, "10:25" 8700, "10:26" 8760)
#set grid
set key top right
set arrow 1 from 8300,115 to 8413,115 lt -1
set arrow 2 from 8413,115 to 8300,115 lt -1
set label "Query Active" at 8320,125
set arrow 3 from 8414,70 to 8496,70 lt -1
set arrow 4 from 8496,70 to 8414,70 lt -1
set label "Query Inactive" at 8420,80
set arrow 5 from 8695,155 to 8750,160 lt -1
set label "Path Loss" at 8620,155
set arrow 6 from 8432,140 to 8415,120 lt -1
set label "Query Timeout" at 8400,155
set arrow 7 from 8476,25 to 8490,5 lt -1
set label "Query Reset" at 8410,30
set arrow 8 from 8685,50 to 8685,90 lt -1
set label "Unobserved Loss" at 8685,45

plot "plot.dat" i 0 u 1:3 pt 7 ps 1 ti 'Application Log', \
     "plot.dat" i 1 u 1:3 pt 6 ps 1 ti 'LiveNet Log',\
     "plot.dat" i 2 u 1:2 w i ti ''
