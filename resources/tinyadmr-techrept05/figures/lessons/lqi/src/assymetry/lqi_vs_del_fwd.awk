BEGIN {
	cnt=0;
	print "#mote pair,Forward Delivery Ratio,Forward Average LQI";
    }
#($3 > 0) && ($8 > 0) {cnt++; print cnt " " $3/10 " " $4/$3 " " $8/10 " " $9/$8;}
#($3 == 0) && ($8 > 0) {cnt++; print cnt " " $3/10 " 50 " $8/10 " " $9/$8;}
#($3 > 0) && ($8 == 0) {cnt++; print cnt " " $3/10 " " $4/$3 " " $8/10 " 50";}
($3 > 0) && ($8 > 0) {cnt++; print  $3/10 " " $4/$3;}
($3 == 0) && ($8 > 0) {cnt++; print  $3/10 " 50 ";}
END {
    }
