BEGIN {
    }
/F/  {split($1,fields,","); 
	if (fields[9] == "F") printf("%d %d %d %f %d ",fields[1],fields[2],fields[3],fields[4],fields[5]);}
/R/  {split($1,fields,","); 
	if (fields[9] == "R") printf("%d %d %d %f %d\n",fields[1],fields[2],fields[6],fields[7],fields[8]);}
END {
    }
