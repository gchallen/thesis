# function: PLOT
# windowSize: 0
# whereClause: time_ms <= (20*60*1000) && success=1 AND nodeDistance=10
# nodeID: 0
# counter: laptoptimeSEC
# old: 0
# new: 0
# breakLineInterval: 
# noZeros: 0
# table: FETCH_SUMMARY
# column: (time_ms/(60000.0))
# starttime: 1123079234.522
# endtime: 1124454509.222
set xrange[0:7]
set ylabel "(time_ms/(60000.0))"
set xlabel "Node Distance (Hops)"
set title "Plot of (time_ms/(60000.0)), Software:ALL"
set output 'fetchlatency-byhops.ps'
set terminal postscript enhanced color solid 14
plot 'fetchlatency-byhops.dat' u ($1):($2):($3) w errorlines ps 1 lw 4 t ""
