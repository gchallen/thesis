TARGETS = sensys08

TEXFILES = $(wildcard *.tex)
PDFS = $(addsuffix .pdf,$(TARGETS))

all: $(PDFS) missing

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

embed: $(PDFS)
	gs -dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=letter -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=sensys08-embed.pdf -f sensys08.pdf
	mv sensys08-embed.pdf sensys08.pdf
	
missing:
	@echo "----------------------------------------------------------"
	@echo "Missing citations:"
	@echo "----------------------------------------------------------"
	@(grep Cit *.log | awk '{print $$4}' | sort | uniq; exit 0)
	@echo "----------------------------------------------------------"
	@echo "Missing references:"
	@echo "----------------------------------------------------------"
	@(grep Ref *.log ; exit 0)


clean:
	/bin/rm -f $(PDFS) *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty

FORCE:

