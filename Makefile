TARGET = thesis
SUBDIRS = 0-frontmatter 1-introduction 2-related 3-evaluation 4-lance 5-idea 6-lessons 7-conclusion
INSTALLDIR = ""
include Makerules

install:: dsp noxxxnote missing-fail embed
	scp $(PDF) werner@minitrue.eecs.harvard.edu:/home/werner/public_html/private/thesis/$(INSTALLDIR)/$(PDF)

allmake: all
	for i in $(SUBDIRS); do $(MAKE) -C $$i --no-print-directory all; done

allclean: clean
	for i in $(SUBDIRS); do $(MAKE) -C $$i --no-print-directory clean; done

allpages: pages
	@$(MAKE) -C 0-frontmatter --no-print-directory pages
	@$(MAKE) -C 1-introduction --no-print-directory pages
	@$(MAKE) -C 2-related --no-print-directory pages
	@$(MAKE) -C 3-evaluation --no-print-directory pages
	@$(MAKE) -C 4-lance --no-print-directory pages
	@$(MAKE) -C 5-idea --no-print-directory pages
	@$(MAKE) -C 6-lessons --no-print-directory pages
	@$(MAKE) -C 7-conclusion --no-print-directory pages

allinstall: install
	@$(MAKE) -C 0-frontmatter --no-print-directory install
	@$(MAKE) -C 1-introduction --no-print-directory install
	@$(MAKE) -C 2-related --no-print-directory install
	@$(MAKE) -C 3-evaluation --no-print-directory install
	@$(MAKE) -C 4-lance --no-print-directory install
	@$(MAKE) -C 5-idea --no-print-directory install
	@$(MAKE) -C 6-lessons --no-print-directory install
	@$(MAKE) -C 7-conclusion --no-print-directory install

FORCE:

