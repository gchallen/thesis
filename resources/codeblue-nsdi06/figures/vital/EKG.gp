set xlabel 'Time'
set ylabel 'EKG data'

set terminal postscript eps color dashed 18
set output "ekg-data.eps"
set xrange [176:180]
set yrange [400:1200]

set grid xtics ytics

plot "EKGLOG" u 1:(1024-$2) t 'Telos EKG data' w lp lw 4

