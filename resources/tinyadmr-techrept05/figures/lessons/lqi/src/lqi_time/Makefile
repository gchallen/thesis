all:	lqi_time lqi_cdf

lqi_time:
	gnuplot plot_time.gplt
	./fix-colors.pl plot.eps
	epstopdf plot.eps
	rm *.eps
	mv plot.pdf plot_time.pdf
lqi_cdf:
	gnuplot plot_cdf.gplt
	./fix-colors.pl plot_cdf.eps
	epstopdf plot_cdf.eps
	rm *.eps

clean:
	rm *.pdf
