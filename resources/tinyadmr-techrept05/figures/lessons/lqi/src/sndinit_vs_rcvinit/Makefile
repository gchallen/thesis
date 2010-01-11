all:
	gnuplot sndinit_vs_rcvinit.gplt
	./fix-colors.pl sndinit_vs_rcvinit.eps
	epstopdf sndinit_vs_rcvinit.eps
	rm *.eps
clean:
	rm *.pdf
