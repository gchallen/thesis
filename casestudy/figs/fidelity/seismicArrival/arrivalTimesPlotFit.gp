set xlabel "Node ID (by normalized distance)"
set ylabel "Time of arrival (seconds)"
set grid
set terminal postscript eps enhanced color solid "Helvetica-18"
set output "arrivalTimesPlotFit.eps"
set xtics ("200" 0.587509165522664, "\n201" 0.636952697393643, "202" 0.740005690939597, "\n203" 0.671875733552797, "204" 0, "\n205" 0.763226112033371, "206" 0.363405232477485, "207" 0.48281263994852, "208" 0.230631109029191, "209" 0.414885502663725, "210" 0.81830754109651, "212" 0.658287552005339, "213" 0.125481048192877, "214" 1, "250" 0.627664044931605, "251" 0.911336104341797)

f0(x) = a0*x + b0 
fit f0(x) "arrivalTimesPlotFit.dat" index 0 using 2:3 via a0,b0 
f1(x) = a1*x + b1 
fit f1(x) "arrivalTimesPlotFit.dat" index 1 using 2:3 via a1,b1 
f2(x) = a2*x + b2 
fit f2(x) "arrivalTimesPlotFit.dat" index 2 using 2:3 via a2,b2 
f3(x) = a3*x + b3 
fit f3(x) "arrivalTimesPlotFit.dat" index 3 using 2:3 via a3,b3 
f4(x) = a4*x + b4 
fit f4(x) "arrivalTimesPlotFit.dat" index 4 using 2:3 via a4,b4 
f5(x) = a5*x + b5 
fit f5(x) "arrivalTimesPlotFit.dat" index 5 using 2:3 via a5,b5 
f6(x) = a6*x + b6 
fit f6(x) "arrivalTimesPlotFit.dat" index 6 using 2:3 via a6,b6 
f7(x) = a7*x + b7 
fit f7(x) "arrivalTimesPlotFit.dat" index 7 using 2:3 via a7,b7 
f8(x) = a8*x + b8 
fit f8(x) "arrivalTimesPlotFit.dat" index 8 using 2:3 via a8,b8 
f9(x) = a9*x + b9 
fit f9(x) "arrivalTimesPlotFit.dat" index 9 using 2:3 via a9,b9 
f10(x) = a10*x + b10 
fit f10(x) "arrivalTimesPlotFit.dat" index 10 using 2:3 via a10,b10 
f11(x) = a11*x + b11 
fit f11(x) "arrivalTimesPlotFit.dat" index 11 using 2:3 via a11,b11 
f12(x) = a12*x + b12 
fit f12(x) "arrivalTimesPlotFit.dat" index 12 using 2:3 via a12,b12 
f13(x) = a13*x + b13 
fit f13(x) "arrivalTimesPlotFit.dat" index 13 using 2:3 via a13,b13 
f14(x) = a14*x + b14 
fit f14(x) "arrivalTimesPlotFit.dat" index 14 using 2:3 via a14,b14 
f15(x) = a15*x + b15 
fit f15(x) "arrivalTimesPlotFit.dat" index 15 using 2:3 via a15,b15 
f16(x) = a16*x + b16 
fit f16(x) "arrivalTimesPlotFit.dat" index 16 using 2:3 via a16,b16 
f17(x) = a17*x + b17 
fit f17(x) "arrivalTimesPlotFit.dat" index 17 using 2:3 via a17,b17 
f18(x) = a18*x + b18 
fit f18(x) "arrivalTimesPlotFit.dat" index 18 using 2:3 via a18,b18 
f19(x) = a19*x + b19 
fit f19(x) "arrivalTimesPlotFit.dat" index 19 using 2:3 via a19,b19 
f20(x) = a20*x + b20 
fit f20(x) "arrivalTimesPlotFit.dat" index 20 using 2:3 via a20,b20 
f21(x) = a21*x + b21 
fit f21(x) "arrivalTimesPlotFit.dat" index 21 using 2:3 via a21,b21 
f22(x) = a22*x + b22 
fit f22(x) "arrivalTimesPlotFit.dat" index 22 using 2:3 via a22,b22 
f23(x) = a23*x + b23 
fit f23(x) "arrivalTimesPlotFit.dat" index 23 using 2:3 via a23,b23 
f24(x) = a24*x + b24 
fit f24(x) "arrivalTimesPlotFit.dat" index 24 using 2:3 via a24,b24 
f25(x) = a25*x + b25 
fit f25(x) "arrivalTimesPlotFit.dat" index 25 using 2:3 via a25,b25 
f26(x) = a26*x + b26 
fit f26(x) "arrivalTimesPlotFit.dat" index 26 using 2:3 via a26,b26 
f27(x) = a27*x + b27 
fit f27(x) "arrivalTimesPlotFit.dat" index 27 using 2:3 via a27,b27 
f28(x) = a28*x + b28 
fit f28(x) "arrivalTimesPlotFit.dat" index 28 using 2:3 via a28,b28 
f29(x) = a29*x + b29 
fit f29(x) "arrivalTimesPlotFit.dat" index 29 using 2:3 via a29,b29 


plot "arrivalTimesPlotFit.dat" index 0 using 2:3 notitle with points lt 0, \
     f0(x) notitle lt 0, \
     "arrivalTimesPlotFit.dat" index 1 using 2:3 notitle with points lt 1, \
     f1(x) notitle lt 1, \
     "arrivalTimesPlotFit.dat" index 2 using 2:3 notitle with points lt 2, \
     f2(x) notitle lt 2, \
     "arrivalTimesPlotFit.dat" index 3 using 2:3 notitle with points lt 3, \
     f3(x) notitle lt 3, \
     "arrivalTimesPlotFit.dat" index 4 using 2:3 notitle with points lt 4, \
     f4(x) notitle lt 4, \
     "arrivalTimesPlotFit.dat" index 5 using 2:3 notitle with points lt 5, \
     f5(x) notitle lt 5, \
     "arrivalTimesPlotFit.dat" index 6 using 2:3 notitle with points lt 6, \
     f6(x) notitle lt 6, \
     "arrivalTimesPlotFit.dat" index 7 using 2:3 notitle with points lt 7, \
     f7(x) notitle lt 7, \
     "arrivalTimesPlotFit.dat" index 8 using 2:3 notitle with points lt 8, \
     f8(x) notitle lt 8, \
     "arrivalTimesPlotFit.dat" index 9 using 2:3 notitle with points lt 9, \
     f9(x) notitle lt 9, \
     "arrivalTimesPlotFit.dat" index 10 using 2:3 notitle with points lt 10, \
     f10(x) notitle lt 10, \
     "arrivalTimesPlotFit.dat" index 11 using 2:3 notitle with points lt 11, \
     f11(x) notitle lt 11, \
     "arrivalTimesPlotFit.dat" index 12 using 2:3 notitle with points lt 12, \
     f12(x) notitle lt 12, \
     "arrivalTimesPlotFit.dat" index 13 using 2:3 notitle with points lt 13, \
     f13(x) notitle lt 13, \
     "arrivalTimesPlotFit.dat" index 14 using 2:3 notitle with points lt 14, \
     f14(x) notitle lt 14


# plot "arrivalTimesPlotFit.dat" index 0 using 2:3 title "2005-08-11\\_08.33.49" with points lt 0, \
#      f0(x) title "2005-08-11\\_08.33.49" lt 0, \
#      "arrivalTimesPlotFit.dat" index 1 using 2:3 title "2005-08-11\\_09.12.38" with points lt 1, \
#      f1(x) title "2005-08-11\\_09.12.38" lt 1, \
#      "arrivalTimesPlotFit.dat" index 2 using 2:3 title "2005-08-11\\_15.04.27" with points lt 2, \
#      f2(x) title "2005-08-11\\_15.04.27" lt 2, \
#      "arrivalTimesPlotFit.dat" index 3 using 2:3 title "2005-08-12\\_00.30.40" with points lt 3, \
#      f3(x) title "2005-08-12\\_00.30.40" lt 3, \
#      "arrivalTimesPlotFit.dat" index 4 using 2:3 title "2005-08-12\\_02.15.18" with points lt 4, \
#      f4(x) title "2005-08-12\\_02.15.18" lt 4, \
#      "arrivalTimesPlotFit.dat" index 5 using 2:3 title "2005-08-13\\_02.17.32" with points lt 5, \
#      f5(x) title "2005-08-13\\_02.17.32" lt 5, \
#      "arrivalTimesPlotFit.dat" index 6 using 2:3 title "2005-08-13\\_04.24.42" with points lt 6, \
#      f6(x) title "2005-08-13\\_04.24.42" lt 6, \
#      "arrivalTimesPlotFit.dat" index 7 using 2:3 title "2005-08-13\\_07.08.05" with points lt 7, \
#      f7(x) title "2005-08-13\\_07.08.05" lt 7, \
#      "arrivalTimesPlotFit.dat" index 8 using 2:3 title "2005-08-14\\_04.32.29" with points lt 8, \
#      f8(x) title "2005-08-14\\_04.32.29" lt 8, \
#      "arrivalTimesPlotFit.dat" index 9 using 2:3 title "2005-08-14\\_20.17.02" with points lt 9, \
#      f9(x) title "2005-08-14\\_20.17.02" lt 9, \
#      "arrivalTimesPlotFit.dat" index 10 using 2:3 title "2005-08-15\\_09.11.28" with points lt 10, \
#      f10(x) title "2005-08-15\\_09.11.28" lt 10, \
#      "arrivalTimesPlotFit.dat" index 11 using 2:3 title "2005-08-15\\_16.04.37" with points lt 11, \
#      f11(x) title "2005-08-15\\_16.04.37" lt 11, \
#      "arrivalTimesPlotFit.dat" index 12 using 2:3 title "2005-08-16\\_01.32.19" with points lt 12, \
#      f12(x) title "2005-08-16\\_01.32.19" lt 12, \
#      "arrivalTimesPlotFit.dat" index 13 using 2:3 title "2005-08-16\\_18.30.04" with points lt 13, \
#      f13(x) title "2005-08-16\\_18.30.04" lt 13, \
#      "arrivalTimesPlotFit.dat" index 14 using 2:3 title "2005-08-18\\_02.45.51" with points lt 14, \
#      f14(x) title "2005-08-18\\_02.45.51" lt 14
     
     