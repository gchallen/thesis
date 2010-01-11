all:
	awk -f lqi.awk CDF.dat | sort -n | awk -f addcnt.awk | tee lqi.dat
	awk -f hop.awk CDF.dat | sort -n | awk -f addcnt.awk | tee hop.dat
	awk -f pathdr.awk CDF.dat | sort -n | awk -f addcnt.awk | tee pathdr.dat
	gnuplot plot_cdf.gplt
	awk -f lqi_oh.awk CDF.dat | sort -n | awk -f addcnt.awk | tee lqi.dat
	awk -f hop_oh.awk CDF.dat | sort -n | awk -f addcnt.awk | tee hop.dat
	awk -f pathdr_oh.awk CDF.dat | sort -n | awk -f addcnt.awk | tee pathdr.dat
	gnuplot plot_oh.gplt
	awk -f lqi_hop.awk CDF.dat | sort -n | awk -f addcnt.awk | tee lqi.dat
	awk -f hop_hop.awk CDF.dat | sort -n | awk -f addcnt.awk | tee hop.dat
	awk -f pathdr_hop.awk CDF.dat | sort -n | awk -f addcnt.awk | tee pathdr.dat
	gnuplot plot_hop.gplt
	awk -f lqi_rcv.awk CDF.dat | sort -n | awk -f addcnt.awk | tee lqi.dat
	awk -f hop_rcv.awk CDF.dat | sort -n | awk -f addcnt.awk | tee hop.dat
	awk -f pathdr_rcv.awk CDF.dat | sort -n | awk -f addcnt.awk | tee pathdr.dat
	gnuplot plot_rcv.gplt
	awk -f lqi_fwd.awk CDF.dat | sort -n | awk -f addcnt.awk | tee lqi.dat
	awk -f hop_fwd.awk CDF.dat | sort -n | awk -f addcnt.awk | tee hop.dat
	awk -f pathdr_fwd.awk CDF.dat | sort -n | awk -f addcnt.awk | tee pathdr.dat
	gnuplot plot_fwd.gplt
	awk -f lqi_norm.awk norm-oh.dat | sort -n | awk -f addcnt.awk | tee lqi.dat
	awk -f hop_norm.awk norm-oh.dat | sort -n | awk -f addcnt.awk | tee hop.dat
	awk -f pathdr_norm.awk norm-oh.dat | sort -n | awk -f addcnt.awk | tee pathdr.dat
	gnuplot plot_norm.gplt
	awk -f lqi_prot.awk CDF.dat | sort -n | awk -f addcnt.awk | tee lqi.dat
	awk -f hop_prot.awk CDF.dat | sort -n | awk -f addcnt.awk | tee hop.dat
	awk -f pathdr_prot.awk CDF.dat | sort -n | awk -f addcnt.awk | tee pathdr.dat
	gnuplot plot_prot.gplt
	./convert.sh
	rm *.eps

copy:
	cp cdf_fwd.pdf ../../lqi-hop-pathdr-cdf-fwd.pdf  
	cp cdf_hop.pdf ../../lqi-hop-pathdr-cdf-hop.pdf  
	cp cdf_oh.pdf ../../lqi-hop-pathdr-cdf-oh.pdf  
	cp cdf_rcv.pdf ../../lqi-hop-pathdr-cdf-rcv.pdf
	cp cdf_prot.pdf ../../lqi-hop-pathdr-cdf-prot.pdf
	cp cdf_norm.pdf ../../lqi-hop-pathdr-cdf-norm.pdf
	cp cdf.pdf ../../lqi-hop-pathdr-cdf.pdf  


clean:
	rm *.pdf *~
