# function: PLOT
# windowSize: 0
# whereClause: success=1 AND bytes>30000 AND nodeDistance=6
# nodeID: 0
# counter: laptoptimeSEC
# old: 0
# new: 0
# breakLineInterval: 
# noZeros: 0
# table: FETCH_SUMMARY
# column: bytesPerSecond
# starttime: 1123079234.522
# endtime: 1124454509.222

set grid noxtics ytics
set xrange [0:7]
set yrange [0:*]
set ylabel "bytes/sec"
set xlabel "Node distance (hops)"
set output 'fetchspeed-oldnew.eps'
set xlabel "Date (GMT)"

set terminal postscript eps enhanced color solid 18

plot \
'fetchspeed-old.out' u ($1):($2):($3) t 'Before reprogram' w errorlines ps 1.5 lw 4 pt 7, \
'fetchspeed-new.out' u ($1):($2):($3) t 'After reprogram' w errorlines ps 1.5 lw 4 pt 7 
