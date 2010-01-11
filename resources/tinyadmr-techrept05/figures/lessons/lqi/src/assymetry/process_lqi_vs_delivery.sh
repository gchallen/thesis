#!/bin/bash

set -x

FILE=lqi_vs_del_fwd

#awk -f firstpass.awk LQI.log | sort | awk -f secondpass_gwq.awk | awk -f lqi_vs_del_fwd.awk
gnuplot $FILE.gplt
./fix-colors.pl $FILE.eps
epstopdf $FILE.eps
rm $FILE.eps
