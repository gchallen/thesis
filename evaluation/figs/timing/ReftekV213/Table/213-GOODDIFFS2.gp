#!/usr/bin/gnuplot -persist
#
#    
#    	G N U P L O T
#    	Version 4.0 patchlevel 0
#    	last modified Thu Apr 15 14:44:22 CEST 2004
#    	System: Linux 2.6.15-1.1831_FC4
#    
#    	Copyright (C) 1986 - 1993, 1998, 2004
#    	Thomas Williams, Colin Kelley and many others
#    
#    	This is gnuplot version 4.0.  Please refer to the documentation
#    	for command syntax changes.  The old syntax will be accepted
#    	throughout the 4.0 series, but all save files use the new syntax.
#    
#    	Type `help` to access the on-line reference manual.
#    	The gnuplot FAQ is available from
#    		http://www.gnuplot.info/faq/
#    
#    	Send comments and requests for help to
#    		<gnuplot-info@lists.sourceforge.net>
#    	Send bugs, suggestions and mods to
#    		<gnuplot-bugs@lists.sourceforge.net>
#    
set terminal postscript landscape enhanced color colortext \
   solid dashlength 1.0 linewidth 1.0 defaultplex \
   palfuncparam 2000,0.003 \
   butt "Helvetica" 18
set output '213-GOODDIFFS2.ps'
unset clip points
set clip one
unset clip two
set bar 1.000000
set border 31 lt -1 lw 1.000
set xdata
set ydata
set zdata
set x2data
set y2data
set timefmt x "%d/%m/%y,%H:%M"
set timefmt y "%d/%m/%y,%H:%M"
set timefmt z "%d/%m/%y,%H:%M"
set timefmt x2 "%d/%m/%y,%H:%M"
set timefmt y2 "%d/%m/%y,%H:%M"
set timefmt cb "%d/%m/%y,%H:%M"
set boxwidth
set style fill empty border
set dummy x,y
set format x "% g"
set format y "% g"
set format x2 "% g"
set format y2 "% g"
set format z "% g"
set format cb "% g"
set angles radians
unset grid
set key title ""
set key right top Right noreverse enhanced box linetype -2 linewidth 1.000 samplen 4 spacing 1 width 0 height 0 autotitles
unset label
unset arrow
unset style line
unset style arrow
unset logscale
set offsets 0, 0, 0, 0
set pointsize 1
set encoding default
unset polar
unset parametric
unset decimalsign
set view 60, 30, 1, 1
set samples 100, 100
set isosamples 10, 10
set surface
unset contour
set clabel '%8.3g'
set mapping cartesian
set datafile separator whitespace
unset hidden3d
set cntrparam order 4
set cntrparam linear
set cntrparam levels auto 5
set cntrparam points 5
set size ratio 0 1,1
set origin 0,0
set style data points
set style function lines
set xzeroaxis lt -2 lw 1.000
set yzeroaxis lt -2 lw 1.000
set x2zeroaxis lt -2 lw 1.000
set y2zeroaxis lt -2 lw 1.000
set tics in
set ticslevel 0.5
set ticscale 1 0.5
set mxtics default
set mytics default
set mztics default
set mx2tics default
set my2tics default
set mcbtics default
set xtics border mirror norotate autofreq 
set ytics border mirror norotate  ("           02:33:30" 1.00000, " 01:52:09" 2.00000, "08/19/05 00:16:22" 3.00000, "           21:33:01" 4.00000, "           17:59:49" 5.00000, "           15:31:06" 6.00000, " 14:23:06" 7.00000, "           13:28:54" 8.00000, "           06:26:50" 9.00000, "           04:54:30" 10.0000, "           03:43:05" 11.0000, "08/18/05 00:52:31" 12.0000, "           16:48:26" 13.0000, " 14:00:43" 14.0000, "           05:07:31" 15.0000, "           02:09:47" 16.0000, "08/17/05 00:22:39" 17.0000, "           09:45:14" 18.0000, "08/16/05 04:04:56" 19.0000, "           19:29:08" 20.0000, " 16:04:37" 21.0000, "           09:11:28" 22.0000, "           07:07:52" 23.0000, "08/15/05 04:48:27" 24.0000, "           15:24:58" 25.0000, " 08:17:51" 26.0000, "           06:16:46" 27.0000, "08/13/05 03:38:08" 28.0000)
set ztics border nomirror norotate autofreq 
set nox2tics
set noy2tics
set cbtics border mirror norotate autofreq 
set title "" 0.000000,0.000000  font ""
set timestamp "" bottom norotate 0.000000,0.000000  ""
set rrange [ * : * ] noreverse nowriteback  # (currently [0.00000:10.0000] )
set trange [ * : * ] noreverse nowriteback  # (currently [-5.00000:5.00000] )
set urange [ * : * ] noreverse nowriteback  # (currently [-5.00000:5.00000] )
set vrange [ * : * ] noreverse nowriteback  # (currently [-5.00000:5.00000] )
set xlabel "Time Lag (ms)" 0.000000,0.000000  font ""
set x2label "" 0.000000,0.000000  font ""
set xrange [ * : * ] noreverse nowriteback  # (currently [0.00000:29.0000] )
set x2range [ * : * ] noreverse nowriteback  # (currently [-10.0000:10.0000] )
set ylabel "Event Time (GMT)" 0.000000,0.000000  font ""
set y2label "" 0.000000,0.000000  font ""
set yrange [ 0.00000 : 29.0000 ] noreverse nowriteback
set xrange [-75:75]
set y2range [ * : * ] noreverse nowriteback  # (currently [-10.0000:10.0000] )
set zlabel "" 0.000000,0.000000  font ""
set zrange [ * : * ] noreverse nowriteback  # (currently [-10.0000:10.0000] )
set cblabel "" 0.000000,0.000000  font ""
set cbrange [ * : * ] noreverse nowriteback  # (currently [-10.0000:10.0000] )
set zero 1e-08
set lmargin -1
set bmargin -1
set rmargin -1
set tmargin -1
set locale "C"
set pm3d scansautomatic flush begin noftriangles nohidden3d implicit corners2color mean
unset pm3d
set palette positive nops_allcF maxcolors 0 gamma 1.5 color model RGB 
set palette rgbformulae 7, 5, 15
set colorbox default
set colorbox vertical origin 0.9,0.2 size 0.1,0.63 bdefault
set loadpath 
set fontpath 
set fit noerrorvariables
set xtics ("0" 0, "-47 " -47, "47" 47)
set grid xtics noytics
plot '213-GOODDIFFS2.out' u 3:2 ps 2 pt 7 t '', '213-LINES.out' w l lw 3 t ''
#    EOF
