SHELL := /bin/bash
TARGET = 2-casestudy

TEXFILES = $(wildcard *.tex)
PDF = $(addsuffix .pdf,$(TARGET))

DOBIBTEX = $(shell if [ -n "`grep '\\cite' *.tex 2>/dev/null`" ] ; then echo "Yes"; else echo "No"; fi)

draft: ssp xxxnote $(PDF) missing
final: dsp noxxxnote $(PDF) missing
all: draft

ssp:
	@echo "\\ssp" > .spacing-new
	@if [ -n "`diff -N 2>/dev/null .spacing .spacing-new`" ]; then\
		mv .spacing-new .spacing; \
		else\
		rm -f .spacing-new; \
		fi

xxxnote:
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

noxxxnote:
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
endif
	pdflatex $*.tex
	pdflatex $*.tex

%.blg: %.bib 
	@true
ifeq ($(DOBIBTEX), Yes)
	pdflatex $*.tex
	bibtex $*
	pdflatex $*.tex
endif

%.toc: %.tex
	pdflatex $*.tex

.embed.pdf: $(PDF)
	gs -dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=letter -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=.embed.pdf -f $(PDF)
	@cp .embed.pdf $(PDF)

embed: .embed.pdf

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

missing-fail: missing
	@if [ "$(MISSINGREFERENCES)" != "" ]; then false; fi
	@if [ "$(MISSINGCITATIONS)" != "" ]; then false; fi

clean:
	@/bin/rm -f $(PDF) *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty *.out *.bak .embed.pdf

install: ssp noxxxnote missing-fail embed
	scp $(PDF) werner@minitrue.eecs.harvard.edu:/home/werner/public_html/private/thesis/chapters/2-$(PDF)

pages: $(PDF)
	@pdfinfo $(PDF) 2>/dev/null | grep "Pages" | awk '{print "$(PDF)", $$2;}'

FORCE:

