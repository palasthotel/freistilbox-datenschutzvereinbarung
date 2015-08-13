all: master.pdf

CSS = freistilbox

all: master.pdf anlage_1.pdf anlage_2.pdf

%.pdf: %.html $(CSS).css Makefile
	prince $< -o $@

%.css: %.scss
	sass $< > $@

%.html: %.md
	multimarkdown $< > $@

.PHONY: clean
clean:
	-rm -f *.pdf *.html *.css *.map
