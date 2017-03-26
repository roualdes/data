################################################################################
# Copyright 2016
# Edward A. Roualdes
#
# Description of File:
# Makefile for rmarkdown rendering to html
#
################################################################################
all:html  # default rule DO NOT EDIT
################################################################################
MAINFILE  := main
RMD = $(MAINFILE:=.Rmd)
HTML = $(MAINFILE:=.html)

.PHONY:html clean
html: $(HTML)

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$<')"

clean:
	-rm -f $(HTML)

open:
	open $(HTML)

copy: html
	cpy $(CURDIR)/$(HTML)
	cpy $(CURDIR)/$(RMD)
