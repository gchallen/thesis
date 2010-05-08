TARGETS = 1 2

TEXFILES = $(wildcard *.tex)
PDFS = $(addsuffix .pdf,$(TARGETS))

all: $(PDFS)

1.pdf:
	pdflatex 1.tex

2.pdf:
	pdflatex 2.tex

clean:
	/bin/rm -f $(PDFS) *.aux *.log

FORCE:

