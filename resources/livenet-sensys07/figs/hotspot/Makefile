new:
	./genbars.py hotspot.csv > inferred-hotspot.bars
	bargraph inferred-hotspot.bars > inferred-hotspot.eps
	epstopdf inferred-hotspot.eps
	rm inferred-hotspot.eps
old:
	bargraph drill-hotspot.bars > drill-hotspot.eps
	epstopdf drill-hotspot.eps
	rm *.eps
