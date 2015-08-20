all: freistilbox_datenschutzvereinbarung.pdf fbdv_anlage_1.pdf fbdv_anlage_2.pdf

CSS = freistilbox

%.pdf: %.html $(CSS).css Makefile
	prince $< -o $@

%.css: %.scss
	sass $< > $@

%.html: %.md
	multimarkdown $< > $@

.PHONY: clean
clean:
	-rm -f *.pdf *.html *.css *.map
