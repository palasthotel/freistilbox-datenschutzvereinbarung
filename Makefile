all: master.pdf

CSS = freistilbox

%.pdf: %.html $(CSS).css Makefile
	prince $< -o $@

$(CSS).css: $(CSS).scss
	sass $< > $@

%.html: %.md $(CSS).css
	multimarkdown $< > $@

.PHONY: clean
clean:
	-rm -f *.pdf *.html *.css *.map

