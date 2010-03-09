# function: WINDOWAVG
# windowSize: 3600
# whereClause: 
# nodeID: 0
# counter: laptoptimeSEC
# old: 0
# new: 0
# breakLineInterval: 7200
# noZeros: 1
# table: FETCH_SUMMARY
# column: bytesPerSecond
# starttime: 1123079234.522
# endtime: 1124454509.222

set key top left Left reverse

set grid noxtics ytics
set xdata time
set xlabel "Date (GMT)"
set xtics font "Helvetica,12"
set format x "%m/%d/05"
set yrange [0:*]
set ylabel "bytes/sec"
set title ""

set terminal postscript eps enhanced color solid 18
set output 'fetchspeed.eps'

plot 'fetchspeed.out' u ($1):($2) t 'Fetch download throughput' w impulses lw 4 lt 3 
