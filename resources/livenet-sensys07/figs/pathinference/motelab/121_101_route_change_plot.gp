# to change to indexing by flow_seqno, uncomment the lines that are commented out and
#comment out the lines immediately before them
set term postscript eps color enhanced
set size 2,1
set output "|epstopdf --filter > path-motelab.pdf"
#set title "Packet Routes over Time"
set xrange [192:1991]
#set xrange [57203:60890]
set xtics 300
set lmargin 24
set rmargin 2
set multiplot
set yrange [-1.1 : 1.1 ]
set ytics .25
set ylabel "Score"
set key left top
set size 2,0.4
set xlabel "Time (seconds)"
#set xlabel "Flow Sequence Numbers"
set origin 0.0,0.0
set bmargin 3
set tmargin 0
#set style line 3 lt rgb "black" lw 2
set pointsize 0.5
set grid
plot "121_101_route_change_plot.dat" index 2:3416 using 2:3 w p lt 7 pt 7 ps 1 notitle
#plot "121_101_route_change_plot.dat" index 2:3416 using 1:3 ls 3 with points notitle
set yrange [0:11]
set ylabel "route"
set ytics ("" 0,"121->109->117->27->101" 1,"121->119->99->101" 2,"121->105->101" 3,"121->105->103->101" 4,"121->105->109->101" 5,"121->117->27->101" 6,"121->117->27->119->99->101" 7,"121->109->101" 8,"121->103->101" 9)
set size 2,0.6
set origin 0.0,0.4
set bmargin 0
set tmargin 1
set format x ""
set xlabel ""
set pointsize 1
set grid
#set style line 1 lt rgb "red" lw 2
#set style line 2 lt rgb "blue" lw 2
plot "121_101_route_change_plot.dat" index 0 using 2:3 w p title "Fully-observed routes" lt 1 pt 7 ps 1.5, \
"121_101_route_change_plot.dat" index 1 using 2:3 w p title "Routes containing inferences" lt 3 pt 7 ps 0.7
#"121_101_route_change_plot.dat" index 0 using 1:3 ls 1 with points title "Fully-observed routes", \
#"121_101_route_change_plot.dat" index 1 using 1:3 ls 2 with points title "Routes containing inferences"
