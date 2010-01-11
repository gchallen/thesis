plot: plot.dat
	./plot.gp
	epstopdf plot.eps
	../../fix-colors.pl plot.eps
	rm plot.eps
	mv plot.pdf drill-rate.pdf
clean:
	rm -f *.pdf *.eps
