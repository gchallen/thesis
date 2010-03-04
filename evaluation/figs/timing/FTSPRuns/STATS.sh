#!/usr/local/bin/bash
TOTAL=`mysql -h motelab -u volcano -pvolcano volcano -e "select count(*) from RECV_STATUS where laptoptime>1123079234522 AND laptoptime<1124454509222 and ISNULL(globalTimeHeuristicDiff)=0"`
GOOD=`mysql -h motelab -u volcano -pvolcano volcano -e "select count(*) from RECV_STATUS where laptoptime>1123079234522 AND laptoptime<1124454509222 and ISNULL(globalTimeHeuristicDiff)=0 and (globalTimeHeuristicDiff/28800)<=1"`
BADMEDIAN=`mysql -h motelab -u volcano -pvolcano volcano -e "select median(globalTimeHeuristicDiff/28800) from RECV_STATUS where laptoptime>1123079234522 AND laptoptime<1124454509222 and ISNULL(globalTimeHeuristicDiff)=0 and (globalTimeHeuristicDiff/28800)>1"`
echo Total: $TOTAL
echo Good: $GOOD
echo Bad Median: $BADMEDIAN
