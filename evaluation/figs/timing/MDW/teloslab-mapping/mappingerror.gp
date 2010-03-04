set terminal postscript eps enhanced color colortext \
   solid dashlength 1.0 linewidth 1.0 defaultplex \
   palfuncparam 2000,0.003 \
   butt "Helvetica" 18
set output 'mappingerror.eps'
set grid xtics ytics 
set logscale x 10
set key bottom right
set ylabel "CDF [Prob error <= x]"
set xlabel "Global time error (sec)" 0.000000,0.000000  font ""
#set xrange [ 0.00000100000 : 1.00 ] noreverse nowriteback
plot \
  'FTSP.mappingerror.hop-1.cdf' u ($2/1e6):($3) w l lw 3 t "1 hop", \
  'FTSP.mappingerror.hop-2.cdf' u ($2/1e6):($3) w l lw 3 t "2 hops", \
  'FTSP.mappingerror.hop-3.cdf' u ($2/1e6):($3) w l lw 3 t "3 hops", \
  'FTSP.mappingerror.hop-4.cdf' u ($2/1e6):($3) w l lw 3 t "4 hops", \
  'FTSP.mappingerror.hop-5.cdf' u ($2/1e6):($3) w l lw 3 t "5 hops", \
  'FTSP.mappingerror.hop-6.cdf' u ($2/1e6):($3) w l lw 3 t "6 hops", \
  'FTSP.mappingerror.hop-7.cdf' u ($2/1e6):($3) w l lw 3 t "7 hops", \
  'FTSP.mappingerror.hop-8.cdf' u ($2/1e6):($3) w l lw 3 t "8 hops", \
  'FTSP.mappingerror.hop-9.cdf' u ($2/1e6):($3) w l lw 3 t "9 hops", \
  'FTSP.mappingerror.hop-10.cdf' u ($2/1e6):($3) w l lw 3 t "10 hops"
