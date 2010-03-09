#!/bin/sh

GRABDATA=$HOME/src/tinyos/volcano2005/src/util/investigateData/grabData.pl

$GRABDATA FETCH_SUMMARY bytesPerSecond fetchspeed.out --statistics --allDistances --errorbars --makePDF --lineWidth=4 --whereclause="success=1 AND bytes>30000"

$GRABDATA FETCH_SUMMARY bytesPerSecond fetchspeed-old.out --old --statistics --allDistances --errorbars --makePDF --lineWidth=4 --whereclause="success=1 AND bytes>30000"

$GRABDATA FETCH_SUMMARY bytesPerSecond fetchspeed-new.out --new --statistics --allDistances --errorbars --makePDF --lineWidth=4 --whereclause="success=1 AND bytes>30000"

acroread fetchspeed.pdf fetchspeed-old.pdf fetchspeed-new.pdf
