set xlabel "Sender"
set ylabel "Receiver"

set key top left Left reverse box

set term postscript eps color solid enhanced "Helvetica" 12
set output "|epstopdf --filter > topology-compare.pdf"

#set term png font arial size 800,600
#set output "topology-compare.png"

#set size square 1,1
#set xrange [0:250]
#set yrange [0:250]

plot x t '', \
  "<zcat topology.dat.gz" u 2:4 t 'Unicast packets' w p ps 2.0 lt 1 lw 5 pt 4, \
  "<zcat groundtruth.dat.gz" u 2:4 t 'Offline measurement' w p ps 1.75 lt 7 pt 6,  \
  "<zcat beacon.dat.gz" u 2:4 t 'Routing protocol beacons' w p ps 1.0 lt 3 pt 7
