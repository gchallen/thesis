SHELL := /bin/bash
TARGET = evaluation

TEXFILES = $(wildcard *.tex)
PDF = $(addsuffix .pdf,$(TARGET))

DOBIBTEX = $(shell if [ -n "`grep '\\cite' *.tex 2>/dev/null`" ] ; then echo "Yes"; else echo "No"; fi)

draft: ssp $(PDF) missing
final: dsp $(PDF) missing
all: draft

ssp:
	@echo "\\ssp" > .spacing-new
	@if [ -n "`diff -N 2>/dev/null .spacing .spacing-new`" ]; then\
		mv .spacing-new .spacing; \
		else\
		rm -f .spacing-new; \
		fi
	@echo "\\newcommand{\\XXXnote}[1]{\\textcolor{red}{\\bf XXX: #1}}" > .xxxnote-new
	@if [ -n "`diff -N 2>/dev/null .xxxnote .xxxnote-new`" ]; then\
		mv .xxxnote-new .xxxnote; \
		else\
		rm -f .xxxnote-new; \
		fi

dsp:
	@echo "\\dsp" > .spacing-new
	@if [ -n "`diff -N 2>/dev/null .spacing .spacing-new`" ]; then\
		mv .spacing-new .spacing; \
		else\
		rm -f .spacing-new; \
		fi
	@echo "\\newcommand{\\XXXnote}[1]{}" > .xxxnote-new
	@if [ -n "`diff -N 2>/dev/null .xxxnote .xxxnote-new`" ]; then\
		mv .xxxnote-new .xxxnote; \
		else\
		rm -f .xxxnote-new; \
		fi

%.dvi: %.tex

%.pdf: %.tex %.bib %.blg %.toc $(TEXFILES) .spacing .xxxnote
	pdflatex $*.tex
ifeq ($(DOBIBTEX), Yes)
	bibtex $*
	pdflatex $*.tex
	pdflatex $*.tex
endif

%.blg: %.bib 
	@true
ifeq ($(DOBIBTEX), Yes)
	pdflatex $*.tex
	bibtex $*
	pdflatex $*.tex
endif

%.toc: %.tex
	pdflatex $*.tex

embed: $(PDF)
	gs -dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=letter -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(TARGET)-embed.pdf -f $(PDF)
	mv $(TARGET)-embed.pdf $(PDF)

MISSINGREFERENCES = $(strip $(shell grep Ref *.log | awk '{print substr($$4, 2, length($$4) - 2)}'))
MISSINGCITATIONS = $(strip $(shell grep Cit *.log | awk '{print substr($$4, 2, length($$4) - 2)}'))
missing:
	@if [ "$(MISSINGREFERENCES)" != "" ]; then\
		echo "-------------------------------------------------------------";\
		echo "Missing references:";\
		echo "-------------------------------------------------------------";\
		echo $(MISSINGREFERENCES);\
		fi
	@if [ "$(MISSINGCITATIONS)" != "" ]; then\
		echo "-------------------------------------------------------------";\
		echo "Missing citations:";\
		echo "-------------------------------------------------------------";\
		echo $(MISSINGCITATIONS);\
		fi

pages: $(PDF)
	@pdfinfo $(PDF) 2>/dev/null | grep "Pages" | awk '{print "$(PDF)", $$2;}'

clean:
	@/bin/rm -f $(PDF) *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty *.out *.bak

FORCE:

