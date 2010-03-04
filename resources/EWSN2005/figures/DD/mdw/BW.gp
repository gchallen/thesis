set term postscript eps color dashed 14
set output "bw.eps"
set key top left Left
set grid noxtics ytics
#set xrange [0:4]
#set yrange [16:37]

#set xtics 1
set ytics 4

set xlabel 'Time (sec)'
set ylabel 'Packets/sec'

set label 'Voting' at 17,3
set label 'Data transfer' at 19,31

set xrange [10:]
set yrange [:32]

plot \
 "../1packetssec.dat" u 1:2 t 'Node 1' w l lw 3, \
 "../2packetssec.dat" u 1:2 t 'Node 2' w l lw 3, \
 "../3packetssec.dat" u 1:2 t 'Node 3' w l lw 3, \
 "../4packetssec.dat" u 1:2 t 'Node 4' w l lw 3, \
 "../5packetssec.dat" u 1:2 t 'Node 5' w l lw 3, \
 "../6packetssec.dat" u 1:2 t 'Node 6' w l lw 3, \
 "../7packetssec.dat" u 1:2 t 'Node 7' w l lw 3, \
 "../8packetssec.dat" u 1:2 t 'Node 8' w l lw 3


