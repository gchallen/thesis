set xlabel "Time of arrival, relative to nodeID= 207  (seconds)"
set ylabel "Event"
set grid
set xrange[-1:1]
set yrange[-1:15]
set terminal postscript eps enhanced color solid "Helvetica-18"
set output "arrivalTimesPlotScatteredEvent.eps"
set ytics ("2005-08-11\\_08.33.49"0, "2005-08-11\\_09.12.38"1, "2005-08-11\\_15.04.27"2, "2005-08-12\\_00.30.40"3, "2005-08-12\\_02.15.18"4, "2005-08-13\\_02.17.32"5, "2005-08-13\\_04.24.42"6, "2005-08-13\\_07.08.05"7, "2005-08-14\\_04.32.29"8, "2005-08-14\\_20.17.02"9, "2005-08-15\\_09.11.28"10, "2005-08-15\\_16.04.37"11, "2005-08-16\\_01.32.19"12, "2005-08-16\\_18.30.04"13, "2005-08-18\\_02.45.51"14)

plot "arrivalTimesPlotScatteredEvent.dat" index 0 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 1 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 2 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 3 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 4 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 5 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 6 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 7 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 8 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 9 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 10 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 11 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 12 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 13 using 3:1 notitle with points pt 1 lt 1 lw 3, \
     "arrivalTimesPlotScatteredEvent.dat" index 14 using 3:1 notitle with points pt 1 lt 1 lw 3
