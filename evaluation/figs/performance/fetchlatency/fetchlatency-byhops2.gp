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
# starttime: 1123730302.617
# endtime: 1124454509.222

set xrange [0:7]
set xtics 1,1,6
set grid noxtics ytics

set ylabel "Fetch download time (minutes)"
set xlabel "Node Distance (Hops)"
set output 'fetchlatency-byhops.eps'
set terminal postscript enhanced color solid 18

set bars 2.0

plot \
'fetchlatency-byhops.dat' u ($1):($2) t '' w i lw 40,  \
'fetchlatency-byhops.dat' u ($1):($2):($3) t '' w errorbars lw 1 lt 3
