#!/usr/local/bin/bash
echo Node 0
mysql -h lula -u werner -pmarybeth FTSPTest -e "select count(*) from FTSPTestSecond_1 where sourceaddr=0"
mysql -h lula -u werner -pmarybeth FTSPTest -e "select count(*) from FTSPTestSecond_1 where sourceaddr=0 AND ((abs(globalClock - rootSentTime) / 28800) * 1000)<10"
mysql -h lula -u werner -pmarybeth FTSPTest -e "select count(*) from FTSPTestSecond_1 where sourceaddr=0 AND mappedGlobalClock!=-1"
mysql -h lula -u werner -pmarybeth FTSPTest -e "select count(*) from FTSPTestSecond_1 where sourceaddr=0 AND ((abs(mappedglobalClock - rootSentTime) / 28800) * 1000)<10"
echo Node 6
mysql -h lula -u werner -pmarybeth FTSPTest -e "select count(*) from FTSPTestSecond_1 where sourceaddr=6;"
mysql -h lula -u werner -pmarybeth FTSPTest -e "select count(*) from FTSPTestSecond_1 where sourceaddr=6 AND ((abs(globalClock - rootSentTime) / 28800) * 1000)<10"
mysql -h lula -u werner -pmarybeth FTSPTest -e "select count(*) from FTSPTestSecond_1 where sourceaddr=6 AND mappedGlobalClock!=-1"
mysql -h lula -u werner -pmarybeth FTSPTest -e "select count(*) from FTSPTestSecond_1 where sourceaddr=6 AND ((abs(mappedglobalClock - rootSentTime) / 28800) * 1000)<10"
