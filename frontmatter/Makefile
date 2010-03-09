SHELL := /bin/bash
TARGET = frontmatter

TEXFILES = $(wildcard *.tex)
PDF = $(addsuffix .pdf,$(TARGET))

all: $(PDF) missing

%.dvi: %.tex

%.pdf: %.tex %.toc $(TEXFILES)
	pdflatex $*.tex
	pdflatex $*.tex
	pdflatex $*.tex

%.toc: %.tex
	pdflatex $*.tex

embed: $(PDF)
	gs -dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=letter -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(TARGET)-embed.pdf -f $(PDF)
	mv $(TARGET)-embed.pdf $(PDF)

pages: $(PDF)
	@pdfinfo $(PDF) 2>/dev/null | grep "Pages" | awk '{print "$(PDF)", $$2;}'

clean:
	@/bin/rm -f $(PDF) *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty *.out *.bak

FORCE:

