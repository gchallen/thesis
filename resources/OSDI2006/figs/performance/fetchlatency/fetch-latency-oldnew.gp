set yrange [0:1]
set ytics 0.1
set grid 
set xlabel "Fetch latency (minutes)"
set ylabel "Prob [x <= X]"
set key bottom right
set output 'fetch-latency-oldnew-cdf.eps'
set terminal postscript enhanced color solid 18
set xrange [0:10]
set xtics 1
plot 'fetch-latency-old.cdf' u ($2):($3) t 'Fetch latency (before reprogram)' w lp lw 4 pt 7, \
  'fetch-latency-new.cdf' u ($2):($3) t 'Fetch latency (after reprogram)' w lp lw 4 pt 7
