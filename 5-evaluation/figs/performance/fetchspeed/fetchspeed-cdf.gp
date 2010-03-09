set yrange [0:1]
set ytics 0.1
set grid 
set xlabel "Fetch throughput (bytes/sec)"
set ylabel "Prob [x <= X]"
set key bottom right
set output 'fetchspeed-cdf.eps'
set terminal postscript enhanced color solid 18
#set xrange [0:20]
#set xtics 1
plot 'fetchspeed-cdf.dat' u ($2):($3) t 'CDF of fetch throughput' w lp lw 4 pt 7 
