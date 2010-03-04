# This gnuplot script file was automatically generate by Gnuplot.java
set xlabel "Time (08/12/05) GMT"
set ylabel "Node ID"
set grid noxtics ytics
set size 0.7, 0.7
set key top right 
set xtics 0,1 
set mxtics 4
set xrange[0:19]
set xtics ("00:00" 11.0, "02:00" 11.083, "04:00" 11.1667, "06:00" 11.25, "08:00" 11.333, "10:00" 11.4166, "12:00" 11.5, "14:00" 11.5833, "16:00" 11.6666, "18:00" 11.75, "20:00" 11.8333, "22:00" 11.91666, "00:00" 12.00)

#set xtics ("1" 0, "2" 1, "3" 2, "4" 3, "5" 4, "6" 5, "7" 6, "8" 7, "9" 8, "10" 9, "11" 10, "12" 11, "13" 12, "14" 13, "15" 14, "16" 15, "17" 16, "18" 17, "19" 18, "20" 19)
set yrange[198:217] 
set ytics 0,1 
set ytics ("200" 200, "201" 201, "202" 202, "203" 203, "204" 204, "205" 205, "206" 206, "207" 207, "208" 208, "209" 209, "210" 210,  "212" 211, "213" 212, "214" 213, "250" 214, "251" 215)
set terminal postscript eps 10 enhanced color solid "Helvetica"
set output "eruptTriggers-20050812.eps"

set xrange [11:12]
plot "eruptTriggers.dat" index 0 using 1:2 title "Global trigger"  with impulse lt 3 lw 0, \
     "eruptTriggers.dat" index 1 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 2 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 3 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 4 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 5 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 6 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 7 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 8 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 9 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 10 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 11 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 12 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 13 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 14 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 15 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7, \
     "eruptTriggers.dat" index 16 using 1:2 notitle  with points ps 0.5 lt 1 lw 1 pt 7
