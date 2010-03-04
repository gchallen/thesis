#set xdata time
#set timefmt "%Y-%m-%dT%H:%M:%S"
#set xrange ['2007-08-02T22:00:00':'2007-08-03T13:59:59']
#set yrange [-50:150]

#plot \
#  "<grep '^FIXED' post-median-simulation.dat" u 12:16 t 'All utility values' w p ps 2, \
#  "<grep 'optimal: Simulated' post-median-simulation.dat" u 12:16 t 'Optimal' w p ps 2 lt 4, \
#  "<grep 'noflash: Simulated' post-median-simulation.dat" u 12:16 t 'Noflash' w p lt 3, \
#  "<grep 'noflash: Actual' post-median-simulation.dat" u 12:16 t 'Actual' w p lt 7

set xrange [0:300]
set yrange [0:300]

plot \
  "<grep '^FIXED' post-median-simulation.dat | sort -r -n -k 16" u 16 t 'All utility values' w p ps 3, \
  "<grep '^optimal: download' post-median-simulation.dat | sort -r -n -k 15" u 15 t 'Optimal' w p ps 2 lt 4, \
  "<grep '^noflash: download' post-median-simulation.dat | sort -r -n -k 15" u 15 t 'Noflash' w p lt 3, \
  "<grep '^flash: download' post-median-simulation.dat | sort -r -n -k 15" u 15 t 'Ideal' w p lt 6, \
  "<grep '^fifo: download' post-median-simulation.dat | sort -r -n -k 15" u 15 t 'FIFO' w p lt 7, \
  "<grep '^actual: download' post-median-simulation.dat | sort -r -n -k 15" u 15 t 'Actual' w p lt 5

#  "<grep '^DOWNLOAD' f | sort -r -n -k 16" u 16 t 'All downloads' w p ps 3 lt 7, \
#  "<grep 'ideal: Simulated' post-median-simulation.dat | sort -r -n -k 16" u 16 t 'Idealized' w p lt 6
  
pause -1
