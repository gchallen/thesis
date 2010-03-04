# This gnuplot script file was automatically generate by Gnuplot.java
set xlabel "Date (August 2005) GMT"
set ylabel "Event triggers per hour" 1,6
set y2label "Global event triggers per hour" 0,-10
set grid noxtics ytics y2tics

set yrange [-200:450]
set ytics 0,50,400
set y2range [0:18]
set y2tics 0,1,5

set key top left Left reverse

set terminal postscript eps 18 enhanced color solid "Helvetica"
set output "eruptCountVsTime.eps"

plot  \
  "eruptCountVsTime.dat" u ($1+1):2 title 'Individual node triggers' w i lt 3 lw 2, \
  "eruptCountVsTime.dat" u ($1+1):3 title 'Global triggers' axes x1y2 w i lt 1 lw 2
