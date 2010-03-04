# Sec 90,000 is 07-21-04 01:00:00 GMT, or 20:00 local time
# Sec 100,000 is 07.21.2004-034640 GMT, or 22:46 local time
# Sec 130,000 is 07.21.2004-120640 GMT, or 7:06:40 local time

#set xlabel 'Time' -1
set ylabel 'Packet loss rate'
# These are shifted a bit so they look right
set xtics ("07/21/2004\n01:00:00 GMT" 90000, "02:00" 93600, "03:00" 97200, "04:00" 100800, "05:00" 104400, "06:00" 108000, "07:00" 111600, "08:00" 115200, "09:00" 118800, "10:00" 122400, "11:00" 126000, "07/21/2004\n12:00:00 GMT" 129600) font "Helvetica,10" 
set size 1,0.5
set grid xtics ytics
set key top right
set ytics 0.02

set term postscript eps color dashed 16
set output "lossrate.eps"

plot [90000:130000] \
  "mote2.lossstats" u 1:4 t 'Mote 2' w l lt 2 lw 3, \
  "mote3.lossstats" u 1:4 t 'Mote 3' w l lt 1 lw 3, \
  "mote4.lossstats" u 1:4 t 'Mote 4' w l lt 3 lw 3

