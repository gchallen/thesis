# to change to indexing by flow_seqno, uncomment the lines that are commented out and
#comment out the lines immediately before them
set term postscript eps color enhanced
set size 2,1
set output "|epstopdf --filter > 22_104_route_change_plot.pdf"
#set title "Packet Routes over Time"
set xrange [8200:9500]
#set xrange [49800:52241]
#set xtics 100
set lmargin 18
set rmargin 2
set multiplot
set xtics ("10:00:00" 7200, "10:05:00" 7500, "10:10:00" 7800, "10:15:00" 8100, \
"10:20:00" 8400, "10:25:00" 8700, "10:30:00" 9000, "10:35:00" 9300, "10:40:00" 9600,\
 "10:45:00" 9900, "10:50:00" 10200, "10:55:00" 10500, "11:00:00" 10800, "11:05:00" 11100,\
  "11:10:00" 11400, "11:15:00" 11700, "11:30:00" 12600)
set yrange [-1.1 : 1.1 ]
set ytics .25
set ylabel "Score"
set key bottom right 
set size 2,0.4
set xlabel "Time"
#set xlabel "Flow Sequence Numbers"
set origin 0.0,0.0
set bmargin 3
set tmargin 0
#set style line 3 lt rgb "black" lw 2
set grid
plot "22_104_route_change_plot.dat" index 2:401 using 2:3 w p lt 7 pt 7 ps 1 notitle
#plot "22_104_route_change_plot.dat" index 2:401 using 1:3 ls 3 with points notitle
set xtics 300
set yrange [0:16]
set ylabel "route"
set ytics ("" 0,"22->68->27->24->67->64->104" 1,"22->27->24->67->64->104" 2,"22->24->64->62->104" 3,"22->21->64->62->104" 4,"22->21->25->68->104" 5,"22->21->25->62->104" 6,"22->68->64->104" 7,"22->68->62->104" 8,"22->26->62->104" 9,"22->21->64->104" 10,"22->21->62->104" 11,"22->21->25->104" 12,"22->68->104" 13,"22->62->104" 14)
set size 2,0.6
set origin 0.0,0.4
set bmargin 0
set tmargin 1
set format x ""
set xlabel ""
set grid
#set style line 1 lt rgb "red" lw 2
#set style line 2 lt rgb "blue" lw 2
plot "22_104_route_change_plot.dat" index 0 using 2:3 w p title "Fully-observed routes" lt 1 pt 7 ps 1.5, \
"22_104_route_change_plot.dat" index 1 using 2:3 with p title "Routes containing inferences" lt 3 pt 7 ps 0.7
#"22_104_route_change_plot.dat" index 0 using 1:3 ls 1 with points title "Fully-observed routes", \
#"22_104_route_change_plot.dat" index 1 using 1:3 ls 2 with points title "Routes containing inferences"
