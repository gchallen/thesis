TARGET = volcanochapter

TEXFILES = $(wildcard *.tex)
PDF = $(addsuffix .pdf,$(TARGET))
PS = $(addsuffix .ps,$(TARGET))

all: $(PDF) missing

%.dvi: %.tex

%.pdf: %.dvi
	dvips -Ppdf -G0 $(TARGET) -o $(PS)
	ps2pdf $(PS) $(PDF)
	rm volcanochapter.ps volcanochapter.dvi

%.dvi: %.tex %.bib %.blg %.toc %.ind $(TEXFILES)
	latex $*.tex
	latex $*.tex
	bibtex $*
	latex $*.tex
	latex $*.tex
	makeindex $*.idx
	latex $*.tex
	latex $*.tex

%.ind: %.tex
	latex $*.tex
	makeindex $*.idx
	latex $*.tex

%.blg: %.bib 
	latex $*.tex
	bibtex $*
	latex $*.tex

%.toc: %.tex
	latex $*.tex

embed: $(PDF)
	gs -dSAFER -dNOPLATFONTS -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sPAPERSIZE=letter -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sOutputFile=$(TARGET)-embed.pdf -f $(PDF)
	mv $(TARGET)-embed.pdf $(PDF)
	
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
	/bin/rm -f $(PDF) *.dvi *.aux *.ps *~ *.log *.lot *.lof *.toc *.blg *.bbl url.sty *.idx *.ilg

FORCE:
