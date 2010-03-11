TARGET = thesis
INSTALLDIR = ""
include Makerules

allmake:
	@$(MAKE) -C 0-frontmatter --no-print-directory
	@$(MAKE) -C 1-introduction --no-print-directory
	@$(MAKE) -C 2-casestudy --no-print-directory
	@$(MAKE) -C 3-related --no-print-directory
	@$(MAKE) -C 4-architecture --no-print-directory
	@$(MAKE) -C 5-evaluation --no-print-directory
	@$(MAKE) -C 6-lance --no-print-directory
	@$(MAKE) -C 7-idea --no-print-directory
	@$(MAKE) -C 8-lessons --no-print-directory
	@$(MAKE) -C 9-conclusion --no-print-directory

allclean: clean
	@$(MAKE) -C 0-frontmatter --no-print-directory clean
	@$(MAKE) -C 1-introduction --no-print-directory clean
	@$(MAKE) -C 2-casestudy --no-print-directory clean
	@$(MAKE) -C 3-related --no-print-directory clean
	@$(MAKE) -C 4-architecture --no-print-directory clean
	@$(MAKE) -C 5-evaluation --no-print-directory clean
	@$(MAKE) -C 6-lance --no-print-directory clean
	@$(MAKE) -C 7-idea --no-print-directory clean
	@$(MAKE) -C 8-lessons --no-print-directory clean
	@$(MAKE) -C 9-conclusion --no-print-directory clean

allpages: pages
	@$(MAKE) -C 0-frontmatter --no-print-directory pages
	@$(MAKE) -C 1-introduction --no-print-directory pages
	@$(MAKE) -C 2-casestudy --no-print-directory pages
	@$(MAKE) -C 3-related --no-print-directory pages
	@$(MAKE) -C 4-architecture --no-print-directory pages
	@$(MAKE) -C 5-evaluation --no-print-directory pages
	@$(MAKE) -C 6-lance --no-print-directory pages
	@$(MAKE) -C 7-idea --no-print-directory pages
	@$(MAKE) -C 8-lessons --no-print-directory pages
	@$(MAKE) -C 9-conclusion --no-print-directory pages

allinstall: install
	@$(MAKE) -C 0-frontmatter --no-print-directory install
	@$(MAKE) -C 1-introduction --no-print-directory install
	@$(MAKE) -C 2-casestudy --no-print-directory install
	@$(MAKE) -C 3-related --no-print-directory install
	@$(MAKE) -C 4-architecture --no-print-directory install
	@$(MAKE) -C 5-evaluation --no-print-directory install
	@$(MAKE) -C 6-lance --no-print-directory install
	@$(MAKE) -C 7-idea --no-print-directory install
	@$(MAKE) -C 8-lessons --no-print-directory install
	@$(MAKE) -C 9-conclusion --no-print-directory install

FORCE:

