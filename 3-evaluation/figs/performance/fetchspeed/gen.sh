#!/bin/sh

GRABDATA=$HOME/src/tinyos/volcano2005/src/util/investigateData/grabData.pl

$GRABDATA FETCH_SUMMARY bytesPerSecond fetchspeed.out --windowedAvg --windowSize=3600 --breakLineInterval=7200 --noZeros --makePDF --lineType="impulses" --lineWidth=4
acroread fetchspeed.pdf
