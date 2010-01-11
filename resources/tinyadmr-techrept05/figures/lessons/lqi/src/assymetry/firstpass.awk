BEGIN {
    }
/SumLQI/ && /received/ && /mostRecentLQI/ && ($3 > $5) {print  $3 "," $5 "," $7 "," $11 "," $9 ",x,x,x,F";}
/SumLQI/ && /received/ && /mostRecentLQI/ && ($3 < $5) {print  $5 "," $3 ",x,x,x," $7 "," $11 "," $9 ",R";}
END {
    }
