set terminal postscript eps enhanced color colortext \
   solid dashlength 1.0 linewidth 1.0 defaultplex \
   palfuncparam 2000,0.003 \
   butt "Helvetica" 18
set output 'rawerror.eps'
set grid xtics ytics 
set logscale x 10
set key bottom right
set ylabel "CDF [Prob error <= x]"
set xlabel "Global time error (sec)" 0.000000,0.000000  font ""
#set xrange [ 0.00000100000 : 1.00 ] noreverse nowriteback
plot \
  'FTSP.rawerror.hop-1.cdf' u ($2/1e6):($3) w l lw 3 t "1 hop", \
  'FTSP.rawerror.hop-2.cdf' u ($2/1e6):($3) w l lw 3 t "2 hops", \
  'FTSP.rawerror.hop-3.cdf' u ($2/1e6):($3) w l lw 3 t "3 hops", \
  'FTSP.rawerror.hop-4.cdf' u ($2/1e6):($3) w l lw 3 t "4 hops"
