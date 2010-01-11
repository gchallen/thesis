all:
	bargraph query-breakdown.bars > query-breakdown.eps
	epstopdf query-breakdown.eps
	rm -f query-breakdown.eps

nounknown:
	bargraph query-breakdown-no-unknown.bars > query-breakdown-no-unknown.eps
	epstopdf query-breakdown-no-unknown.eps
	rm -f query-breakdown-no-unknown.eps

coverage:
	bargraph query-coverage.bars > query-coverage.eps
	epstopdf query-coverage.eps
	rm -f query-coverage.eps

clean:
	rm -f *.pdf *.eps *.ps
