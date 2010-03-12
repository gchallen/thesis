set xlabel "Node ID (by normalized distance)"
set ylabel "Time of arrival (seconds)"
set grid
set yrange[-.025:]
set terminal postscript eps enhanced color solid "Helvetica-18"
set output "arrivalTimesPlot.eps"
set xtics ("200" 0.587509165522664, "\n201" 0.636952697393643, "202" 0.740005690939597, "\n203" 0.671875733552797, "204" 0, "\n205" 0.763226112033371, "206" 0.363405232477485, "207" 0.48281263994852, "208" 0.230631109029191, "209" 0.414885502663725, "210" 0.81830754109651, "212" 0.658287552005339, "213" 0.125481048192877, "214" 1, "250" 0.627664044931605, "251" 0.911336104341797)

plot "arrivalTimesPlot.dat" index 0 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 1 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 2 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 3 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 4 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 5 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 6 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 7 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 8 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 9 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 10 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 11 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 12 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 13 using 2:3 notitle with linespoints, \
     "arrivalTimesPlot.dat" index 14 using 2:3 notitle with linespoints

# plot "arrivalTimesPlot.dat" index 0 using 2:3 title "2005-08-11\\_08.33.49" with linespoints, \
#      "arrivalTimesPlot.dat" index 1 using 2:3 title "2005-08-11\\_09.12.38" with linespoints, \
#      "arrivalTimesPlot.dat" index 2 using 2:3 title "2005-08-11\\_15.04.27" with linespoints, \
#      "arrivalTimesPlot.dat" index 3 using 2:3 title "2005-08-12\\_00.30.40" with linespoints, \
#      "arrivalTimesPlot.dat" index 4 using 2:3 title "2005-08-12\\_02.15.18" with linespoints, \
#      "arrivalTimesPlot.dat" index 5 using 2:3 title "2005-08-13\\_02.17.32" with linespoints, \
#      "arrivalTimesPlot.dat" index 6 using 2:3 title "2005-08-13\\_04.24.42" with linespoints, \
#      "arrivalTimesPlot.dat" index 7 using 2:3 title "2005-08-13\\_07.08.05" with linespoints, \
#      "arrivalTimesPlot.dat" index 8 using 2:3 title "2005-08-14\\_04.32.29" with linespoints, \
#      "arrivalTimesPlot.dat" index 9 using 2:3 title "2005-08-14\\_20.17.02" with linespoints, \
#      "arrivalTimesPlot.dat" index 10 using 2:3 title "2005-08-15\\_09.11.28" with linespoints, \
#      "arrivalTimesPlot.dat" index 11 using 2:3 title "2005-08-15\\_16.04.37" with linespoints, \
#      "arrivalTimesPlot.dat" index 12 using 2:3 title "2005-08-16\\_01.32.19" with linespoints, \
#      "arrivalTimesPlot.dat" index 13 using 2:3 title "2005-08-16\\_18.30.04" with linespoints, \
#      "arrivalTimesPlot.dat" index 14 using 2:3 title "2005-08-18\\_02.45.51" with linespoints
