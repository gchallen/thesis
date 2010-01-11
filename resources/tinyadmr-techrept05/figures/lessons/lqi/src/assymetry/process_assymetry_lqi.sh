#!/bin/bash

set -x

FILE=assymetry_lqi

gnuplot $FILE.gplt
./fix-colors.pl $FILE.eps
epstopdf $FILE.eps
rm $FILE.eps
