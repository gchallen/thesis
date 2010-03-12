#!/bin/sh

echo "Getting data..."

# All data
#mysql -B -e 'select count(sourceAddr),seqno,((max(globalClock)-min(globalClock))/28800.000000),insert_time from FTSPTest1_20051207185456_1 group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest > FTSP.spread

#mysql -B -e 'select count(sourceAddr),seqno,((max(globalClock)-min(globalClock))/28800.000000),insert_time from FTSPTest1_20051207185456_1 where is_synced=1 group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest > FTSP.spread.synced

#mysql -B -e 'select seqno,(rootSentTime-rootSendTime)/28800.0000000,insert_time from FTSPTest1_20051207185456_1 group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest > FTSP.rootsend

# Groups of nodes
#mysql -B -e 'select count(sourceAddr),seqno,((max(globalClock)-min(globalClock))/28800.000000),insert_time from FTSPTest1_20051207185456_1 where is_synced=1 && sourceAddr <= 1 group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest | grep '^2' > FTSP.spread.nodes.0-1

#mysql -B -e 'select count(sourceAddr),seqno,((max(globalClock)-min(globalClock))/28800.000000),insert_time from FTSPTest1_20051207185456_1 where is_synced=1 && sourceAddr <= 2 group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest | grep '^3' > FTSP.spread.nodes.0-2

#mysql -B -e 'select count(sourceAddr),seqno,((max(globalClock)-min(globalClock))/28800.000000),insert_time from FTSPTest1_20051207185456_1 where is_synced=1 && sourceAddr <= 5 group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest | grep '^6' > FTSP.spread.nodes.0-5

#mysql -B -e 'select count(sourceAddr),seqno,((max(globalClock)-min(globalClock))/28800.000000),insert_time from FTSPTest1_20051207185456_1 where is_synced=1 && sourceAddr <= 9 group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest | grep '^10' > FTSP.spread.nodes.0-9

# Specific nodes
#for i in 1 2 3 4 5 6 7 8 9 10; do
#  echo "Getting data for hopcount $i..."
#  echo -n "# FTSP mapping error for hopcount $i\n#" > FTSP.mappingerror.hop-$i.out
#  mysql -B -e 'select count(sourceAddr),seqno,(((abs(mappedGlobalClock-rootSentTime))/28800.0)*1000000.0),insert_time from FTSPTestSecond_1 where (mappedGlobalClock != -1) and is_synced=1 AND nodeDistance='$i' group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest >> FTSP.mappingerror.hop-$i.out
#  echo "Generating CDF for hopcount $i..."
#  echo -n "# FTSP mapping error CDF for hopcount $i\n#" > FTSP.mappingerror.hop-$i.cdf
#  ./cdf.pl FTSP.mappingerror.hop-$i.out 3 1 >> FTSP.mappingerror.hop-$i.cdf
#done

# Specific nodes
for i in 1 2 3 4 5 6 7 8 9 10; do
  echo "Getting data for hopcount $i..."
  #echo -n "# FTSP raw error for hopcount $i\n#" > FTSP.rawerror.hop-$i.out
  #mysql -B -e 'select count(sourceAddr),seqno,(((abs(globalClock-rootSentTime))/28800.0)*1000000.0),insert_time from FTSPTestSecond_1 where (globalClock != -1) and is_synced=1 AND nodeDistance='$i' group by seqno,insert_time order by insert_time;' -h lula.eecs.harvard.edu -u mdw --password=mdw FTSPTest >> FTSP.rawerror.hop-$i.out
  echo "Generating CDF for hopcount $i..."
  echo -n "# FTSP raw error CDF for hopcount $i\n#" > FTSP.rawerror.hop-$i.cdf
  ./cdf.pl FTSP.rawerror.hop-$i.out 3 100 >> FTSP.rawerror.hop-$i.cdf
done
  
#./cdf.pl FTSP.spread.nodes.0-1 3 0.00025 > nodes.0-1.cdf
#./cdf.pl FTSP.spread.nodes.0-2 3 0.00025 > nodes.0-2.cdf
#./cdf.pl FTSP.spread.nodes.0-5 3 0.00025 > nodes.0-5.cdf
#./cdf.pl FTSP.spread.nodes.0-9 3 0.00025 > nodes.0-9.cdf
#
## Individual nodes
#./cdf.pl FTSP.spread.node.2 3 0.00025 > node.2.cdf
#./cdf.pl FTSP.spread.node.5 3 0.00025 > node.5.cdf
#./cdf.pl FTSP.spread.node.9 3 0.00025 > node.9.cdf
#
echo "Generating plots... "
gnuplot mappingerror.gp
epstopdf mappingerror.eps

#gnuplot plot-cdf-groups.gp
#epstopdf plot-cdf-groups.eps
#gnuplot plot-cdf-pernode.gp
#epstopdf plot-cdf-pernode.eps

