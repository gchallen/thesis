# This gnuplot script file was automatically generate by Gnuplot.java
#set title "Yields CDF\n(started on: 2005-08-01\\_00.00.00)"
set xlabel "Event block yield (%)"
set ylabel "Prob [X {/Symbol \243} x]"
set grid
set key top left 
set yrange[0:1] 
set xrange[0:100]
set terminal postscript eps enhanced color "Helvetica" 18

set output "schBlockYieldCDF_after.eps"
plot "schBlockYieldCDF_after.dat" index 0 using 1:2 notitle  with lines lt 1 lw 4

set output "schBlockYieldCDF_entire.eps"
plot "schBlockYieldCDF_entire.dat" index 0 using 1:2 notitle  with lines lt 1 lw 4

set output "schBlockYieldCDF_entireBeforeAfter.eps"
plot "schBlockYieldCDF_entire.dat" index 0 using 1:2 title "entire deployment"  with lines lt 1 lw 4, \
     "schBlockYieldCDF_before.dat" index 0 using 1:2 title "before reprogramming" with lines lt 3 lw 4, \
     "schBlockYieldCDF_after.dat" index 0 using 1:2 title "after reprogramming"  with lines lt 2 lw 4
