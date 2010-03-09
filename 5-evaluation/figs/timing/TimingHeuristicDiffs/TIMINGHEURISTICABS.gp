# function: CDF
# windowSize: 0
# whereClause: ISNULL(globalTimeHeuristicDiff)=0
# nodeID: 251
# counter: laptoptimeSEC
# old: 0
# new: 1
# breakLineInterval: 
# noZeros: 0
# table: RECV_STATUS
# column: ((abs(globalTimeHeuristicDiff)/28800)*1000)
# starttime: 1123730302.617
# endtime: 1124454509.222
set yrange [0:1]
set ytics 0.1
set grid lw 3
set xlabel "((abs(globalTimeHeuristicDiff)/28800)*1000)"
set key top left
set logscale x
set output 'TIMINGHEURISTICABS.ps'
set terminal postscript enhanced color solid 14
plot 'TIMINGHEURISTICABS-200.out' u ($1):($2) w l lw 3 t "200", 'TIMINGHEURISTICABS-201.out' u ($1):($2) w l lw 3 t "201", 'TIMINGHEURISTICABS-202.out' u ($1):($2) w l lw 3 t "202", 'TIMINGHEURISTICABS-203.out' u ($1):($2) w l lw 3 t "203", 'TIMINGHEURISTICABS-204.out' u ($1):($2) w l lw 3 t "204", 'TIMINGHEURISTICABS-205.out' u ($1):($2) w l lw 3 t "205", 'TIMINGHEURISTICABS-206.out' u ($1):($2) w l lw 3 t "206", 'TIMINGHEURISTICABS-207.out' u ($1):($2) w l lw 3 t "207", 'TIMINGHEURISTICABS-208.out' u ($1):($2) w l lw 3 t "208", 'TIMINGHEURISTICABS-209.out' u ($1):($2) w l lw 3 t "209", 'TIMINGHEURISTICABS-210.out' u ($1):($2) w l lw 3 t "210", 'TIMINGHEURISTICABS-212.out' u ($1):($2) w l lw 3 t "212", 'TIMINGHEURISTICABS-213.out' u ($1):($2) w l lw 3 t "213", 'TIMINGHEURISTICABS-214.out' u ($1):($2) w l lw 3 t "214", 'TIMINGHEURISTICABS-250.out' u ($1):($2) w l lw 3 t "250", 'TIMINGHEURISTICABS-251.out' u ($1):($2) w l lw 3 t "251"
