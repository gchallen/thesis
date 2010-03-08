TARGETS = thesis

TEXFILES = $(wildcard introduction/*.tex) \
					 $(wildcard background/*.tex) \
					 $(wildcard related/*.tex) \
					 $(wildcard casestudy/*.tex) \
					 $(wildcard evaluation/*.tex) \
					 $(wildcard lance/*.tex) \
					 $(wildcard idea/*.tex) \
					 $(wildcard lessons/*.tex) \
					 $(wildcard conclusion/*.tex)
					 
PDFS = $(addsuffix .pdf,$(TARGETS))

all: $(PDFS) missing

%.dvi: %.tex

%.pdf: %.tex %.bib %.blg %.toc $(TEXFILES)
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
	@/bin/rm -f $(PDFS) *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty *.out *.bak

allmake:
	@cd introduction && make
	@cd background && make
	@cd related && make
	@cd casestudy && make
	@cd evaluation && make
	@cd lance && make
	@cd idea && make
	@cd lessons && make
	@cd conclusion && make

allclean:
	@cd introduction && make clean
	@cd background && make clean
	@cd related && make clean
	@cd casestudy && make clean
	@cd evaluation && make clean
	@cd lance && make clean
	@cd idea && make clean
	@cd lessons && make clean
	@cd conclusion && make clean

FORCE:

