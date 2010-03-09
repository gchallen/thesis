# This gnuplot script file was automatically generate by Gnuplot
set grid
set size 0.7, 0.7
set key top right 
set xtics 0,1 
set mxtics 4
set xtics ("1" 0, "2" 1, "3" 2, "4" 3, "5" 4, "6" 5, "7" 6, "8" 7, "9" 8, "10" 9, "11" 10, "12" 11, "13" 12, "14" 13, "15" 14, "16" 15, "17" 16, "18" 17, "19" 18, "20" 19)
#set yrange[-10:110]
set yrange [0:20]
set terminal postscript eps enhanced color solid "Helvetica-18"
set xlabel "Date (August 2005)"

set label "1" at 3.25,16.5 font "Helvetica,12" front point ps 2 pt 6 lt 1 offset -1,0
set label "2" at 6.75,1 font "Helvetica,12" front point ps 2 pt 6 lt 1 offset -1,0
set label "3" at 9.75,11.5 font "Helvetica,12" front point ps 2 pt 6 lt 1 offset -1,0
set label "4" at 11.25,13 font "Helvetica,12" front point ps 2 pt 6 lt 1 offset -1,0
set label "5" at 13.5,1 font "Helvetica,12" front point ps 2 pt 6 lt 1 offset -1,0
set label "6" at 17.75,15.65 font "Helvetica,12" front point ps 2 pt 6 lt 1 offset -1,0

set ylabel "Nbr of Nodes"
set yrange [0:18]
set ytics 4
set output "nodesalive.eps"
plot "nodesalive.dat" using 1:4 title '' with points ps 1.0 lt 3 lw 3 pt 7


#     "nodesalive.dat" using 1:3 title "nbr nodes seen so far"  with steps lt 3 lw 1, \
#     "nodesalive.dat" using 1:2 title "all nodes"  with steps lt 2 lw 1

#set title "Percentage of Failed Nodes"
#set ylabel "Percent of Nodes"
#set yrange[0:120]
#set output "percFailedNodes.eps"
#plot "nodesalive.dat" using 1:6 title "of nodes seen so far"  with points ps 0.5 lt 1 lw 1, \
#     "nodesalive.dat" using 1:5 title "of all nodes"  with points ps 0.5 lt 3 lw 1
