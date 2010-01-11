# to change to indexing by flow_seqno, uncomment the lines that are commented out and
#comment out the lines immediately before them
set term postscript eps color enhanced
set size 2,1
set output "22_104_route_change_plot.eps"
set title "Packet Routes over Time"
set xrange [8132:10818]
#set xrange [49800:52241]
set xtics 100
set lmargin 18
set rmargin 2
set multiplot
set yrange [-1.1 : 1.1 ]
set ytics .25
set ylabel "Score"
set key left top
set size 2,0.4
set xlabel "time (seconds)"
#set xlabel "Flow Sequence Numbers"
set origin 0.0,0.0
set bmargin 3
set tmargin 0
set style line 3 lt rgb "black" lw 2
set grid
plot "22_104_route_change_plot.dat" index 2:1013 using 2:3 ls 3 with points notitle
#plot "22_104_route_change_plot.dat" index 2:1013 using 1:3 ls 3 with points notitle
set yrange [0:18]
set ylabel "route"
set ytics ("" 0,"22->27->24->67->64->104" 1,"22->21->64->62->104" 2,"22->21->25->62->104" 3,"22->68->64->104" 4,"22->68->62->104" 5,"22->27->64->104" 6,"22->27->24->104" 7,"22->26->62->104" 8,"22->24->64->104" 9,"22->21->64->104" 10,"22->21->62->104" 11,"22->21->25->104" 12,"22->68->104" 13,"22->62->104" 14,"22->26->104" 15,"22->21->104" 16)
set size 2,0.6
set origin 0.0,0.4
set bmargin 0
set tmargin 1
set format x ""
set xlabel ""
set grid
set style line 1 lt rgb "red" lw 2
set style line 2 lt rgb "blue" lw 2
plot "22_104_route_change_plot.dat" index 0 using 2:3 ls 1 with points title "Fully-observed routes", \
"22_104_route_change_plot.dat" index 1 using 2:3 ls 2 with points title "Routes containing inferences"
#"22_104_route_change_plot.dat" index 0 using 1:3 ls 1 with points title "Fully-observed routes", \
#"22_104_route_change_plot.dat" index 1 using 1:3 ls 2 with points title "Routes containing inferences"
