#set title "Acoustic Arrival Times"
set xlabel "Distance from vent (meters)"
set ylabel "Arrival time (seconds)"
set grid
set yrange[-2:40]
set ytics ("0"  0, "2"  2, "4"  4, "6"  6, \
           "0" 10, "2" 12, "4" 14, "6" 16, \
           "0" 20, "2" 22, "4" 24, "6" 26, \
           "0" 30, "2" 32, "4" 34, "6" 36)

set label "08/12/05  02:15:18\nvelocity: 342 m/s\nR^{2}: 0.9999" at 2500, 5
set label "08/13/05  01:27:46\nvelocity: 346 m/s\nR^{2}: 0.9995" at 2500, 17
set label "08/15/05  19:29:08\nvelocity: 339 m/s\nR^{2}: 0.9998" at 2500, 28
set label "08/16/05  09:45:14\nvelocity: 331 m/s\nR^{2}: 0.9988" at 2500, 38
           
set key top left
set terminal postscript enhanced color solid "Helvetica" 18
set output "acoustic.ps"

f0(x) = m0*x + b0 
fit f0(x) "acoustic.data" index 0 using 2:5 via m0,b0 
g0(x) = (f0(x)>=-0.5 ? (f0(x) + 0) : 1/0)

f1(x) = m1*x + b1 
fit f1(x) "acoustic.data" index 1 using 2:5 via m1,b1
g1(x) = f1(x) + 10

f2(x) = m2*x + b2 
fit f2(x) "acoustic.data" index 2 using 2:5 via m2,b2 
g2(x) = f2(x) + 20

f3(x) = m3*x + b3 
fit f3(x) "acoustic.data" index 3 using 2:5 via m3,b3
g3(x) = f3(x) + 30

plot "acoustic.data" index 0 using 2:($5+0) notitle with points lt 1 lw 4, \
     g0(x) notitle lt 1 lw 4, \
     "acoustic.data" index 1 using 2:($5+10) notitle with points lt 3 lw 4, \
     g1(x) notitle lt 3 lw 4, \
     "acoustic.data" index 2 using 2:($5+20) notitle with points lt 2 lw 4, \
     g2(x) notitle lt 2 lw 4, \
     "acoustic.data" index 3 using 2:($5+30) notitle with points lt 4 lw 4, \
     g3(x) notitle lt 4 lw 4


# plot "acoustic.data" index 0 using 2:($5+0) title "2005-08-12\\_02.15.18" with points lt 1 lw 4, \
#      f0(x) notitle lt 1 lw 4, \
#      "acoustic.data" index 1 using 2:($5+10) title "2005-08-13\\_01.27.46" with points lt 3 lw 4, \
#      g1(x) notitle lt 3 lw 4, \
#      "acoustic.data" index 2 using 2:($5+20) title "2005-08-15\\_19.29.08" with points lt 2 lw 4, \
#      g2(x) notitle lt 2 lw 4, \
#      "acoustic.data" index 3 using 2:($5+30) title "2005-08-16\\_09.45.14" with points lt 4 lw 4, \
#      g3(x) notitle lt 4 lw 4
     
