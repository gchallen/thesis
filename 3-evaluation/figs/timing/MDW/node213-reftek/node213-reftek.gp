set terminal postscript eps enhanced color colortext \
   solid dashlength 1.0 linewidth 1.0 defaultplex \
   palfuncparam 2000,0.003 \
   butt "Helvetica" 14
set output 'node213-reftek.eps'

set xlabel "Time (GMT) 08/13/2005"
set grid xtics noytics
set ytics ("Node 213" 0.05, "Reftek" -0.05)
set xdata time
set timefmt "%s"
set format x "%H:%M:%S"
set xrange [1123910200:1123910260]
set yrange [-0.1:0.1]
set key right top Right noreverse enhanced box linetype -2 linewidth 1.000 samplen 4 spacing 1 width 0 height 0 autotitles
plot "<zcat node-213.filtered.gz" u ($1):($2+0.05) t '' w l, \
     "<zcat RVEN.out" u ($1):($2-0.05) t '' w l lt 3
