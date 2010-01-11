set xlabel "Number of sniffers"
set ylabel "Average coverage"

set key bottom right
set grid

set term postscript eps enhanced color solid "Helvetica" 18
set output "|epstopdf --filter > coverage-motelab.pdf"

plot "ALL-COVERAGE-AVERAGE.dat" u 2:4 t 'Average coverage' w lp lw 4 ps 1 pt 3

