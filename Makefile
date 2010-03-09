SHELL := /bin/bash
TARGET = thesis

TEXFILES = $(wildcard *.tex) \
					 $(wildcard 0-frontmatter/*.tex) \
					 $(wildcard 1-introduction/*.tex) \
					 $(wildcard 2-background/*.tex) \
					 $(wildcard 3-related/*.tex) \
					 $(wildcard 4-casestudy/*.tex) \
					 $(wildcard 5-evaluation/*.tex) \
					 $(wildcard 6-lance/*.tex) \
					 $(wildcard 7-idea/*.tex) \
					 $(wildcard 8-lessons/*.tex) \
					 $(wildcard 9-conclusion/*.tex)
					 
PDF = $(addsuffix .pdf,$(TARGET))

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
	bibtex $*
	pdflatex $*.tex
	pdflatex $*.tex

%.blg: %.bib 
	pdflatex $*.tex
	bibtex $*
	pdflatex $*.tex

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

clean:
	@/bin/rm -f $(PDF) *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty *.out *.bak

pages: $(PDF)
	@pdfinfo $(PDF) 2>/dev/null | grep "Pages" | awk '{print "$(PDF)", $$2;}'

allmake:
	@$(MAKE) -C 1-introduction --no-print-directory
	@$(MAKE) -C 2-background --no-print-directory
	@$(MAKE) -C 3-related --no-print-directory
	@$(MAKE) -C 4-casestudy --no-print-directory
	@$(MAKE) -C 5-evaluation --no-print-directory
	@$(MAKE) -C 6-lance --no-print-directory
	@$(MAKE) -C 7-idea --no-print-directory
	@$(MAKE) -C 8-lessons --no-print-directory
	@$(MAKE) -C 9-conclusion --no-print-directory

allclean: clean
	@$(MAKE) -C 1-introduction --no-print-directory clean
	@$(MAKE) -C 2-background --no-print-directory clean
	@$(MAKE) -C 3-related --no-print-directory clean
	@$(MAKE) -C 4-casestudy --no-print-directory clean
	@$(MAKE) -C 5-evaluation --no-print-directory clean
	@$(MAKE) -C 6-lance --no-print-directory clean
	@$(MAKE) -C 7-idea --no-print-directory clean
	@$(MAKE) -C 8-lessons --no-print-directory clean
	@$(MAKE) -C 9-conclusion --no-print-directory clean

allpages: pages
	@$(MAKE) -C 1-introduction --no-print-directory pages
	@$(MAKE) -C 2-background --no-print-directory pages
	@$(MAKE) -C 3-related --no-print-directory pages
	@$(MAKE) -C 4-casestudy --no-print-directory pages
	@$(MAKE) -C 5-evaluation --no-print-directory pages
	@$(MAKE) -C 6-lance --no-print-directory pages
	@$(MAKE) -C 7-idea --no-print-directory pages
	@$(MAKE) -C 8-lessons --no-print-directory pages
	@$(MAKE) -C 9-conclusion --no-print-directory pages

FORCE:

