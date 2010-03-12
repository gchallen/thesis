set xlabel "Date (August 2005)"
set ylabel "Nbr of reboots"
set grid noxtics ytics
set label "108 reboots" at graph 0.4, 0.95
set arrow from graph 0.4, 0.95 to graph 0.328, 0.95 lt 7
set label "288 reboots" at graph 0.4, 0.90
set arrow from graph 0.4, 0.90 to graph 0.333, 0.90 lt 7
set label "264 reboots" at graph 0.4, 0.85
set arrow from graph 0.4, 0.85 to graph 0.366, 0.85 lt 7
set yrange [0:20]
set xdata time
set timefmt "%s"
set format x "%d"
set terminal postscript eps enhanced color solid "Helvetica-18"
set output "nodeRebootsBinned.eps"
plot "nodeRebootsBinned.dat" index 0 using 2:3 title "binSize= 60 mins" with impuls
