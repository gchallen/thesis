all:
	gnuplot plot.gplt
	./fix-colors.pl plot.eps
	epstopdf plot.eps
	rm *.eps
clean:
	rm *.pdf
