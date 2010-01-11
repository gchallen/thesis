set term postscript eps color solid enhanced "Helvetica,18"
set output "type.eps"
set title ""
set yrange [0:29]
set xrange [9559:9591]
set ylabel "Original Sender Node ID"
set xlabel "Time(s)" font "Helvetica, 14"
set xtics 10
set grid noxtics ytics

set label 'Broadcast-storm triggered by a bug' at 9565,24.5 textcolor lt 3 font "Helvetica,18"
set arrow from 9570,23.5 to 9569,22.3 lt -1

set ytics ("21" 2,"22" 3,"23" 4,"24" 5,"25" 6,"26" 7,"27" 8,"28" 9,"29" 10,"30" 11,"61" 12,"62" 13,"64" 14,"65" 15,"67" 16,"68" 17,"100" 18,"101" 19,"104" 20,"Invalid" 22)

set xtics ("10:39:20" 9560,"10:39:25" 9565,  "10:39:30" 9570, "10:39:35" 9575, "10:39:40" 9580, "10:39:45" 9585,"10:39:50" 9590,"10:39:55" 9595, "10:40:00" 9600)
plot "type.dat" index 12:12 using 1:2 ti "query / status" with points 2 8, \
"type.dat" index 2:2 using 1:2 ti "query reply" with points 1 3, \
"type.dat" index 10:10 using 1:2 ti "route maintenance" with points 3 12, \
"type.dat" index 11:11 using 1:2 ti "corrupted packets" with points 4 11

#"type.dat" index 6:6 using 1:2 ti "query" with points 2 8, \
#"type.dat" index 0:0 using 1:2 ti "advertisement" with points 2 1, \
#"type.dat" index 5:5 using 1:2 ti "FLOWBCNMSG" with points 3 6, \
#"type.dat" index 1:1 using 1:2 ti "FLOWMSG" with points 2 2, \
#"type.dat" index 4:4 using 1:2 ti "FLOW_ACK" with points 5 5, \
#"type.dat" index 7:7 using 1:2 ti "CBM_UNKNOWN" with points 8 8, \
#"type.dat" index 3:3 using 1:2 ti "LCDREPLY" with points 4 4, \
#"type.dat" index 8:8 using 1:2 ti "ETAGREPLY" with points 9 9, \
#"type.dat" index 9:9 using 1:2 ti "tree refresh packets" with points 3 12, \
