set yrange [0:1]
set ytics 0.1
set grid 
set xlabel "Fetch latency (minutes)"
set ylabel "Prob [x <= X]"
set key bottom right
set output 'fetch-latency-cdf.eps'
set terminal postscript enhanced color solid 18
set xrange [0:20]
set xtics 1
plot 'fetch-latency-skim.cdf' u ($2):($3) t 'CDF of fetch latency' w lp lw 4 pt 7 
