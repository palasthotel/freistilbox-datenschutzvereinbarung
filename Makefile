DOCUMENT = master
CSS = freistilbox

$(DOCUMENT).pdf: $(DOCUMENT).html $(CSS).css fMakefile
	prince $< -o $@

$(CSS).css: $(CSS).scss
	sass $< >$@

$(DOCUMENT).html: $(DOCUMENT).md $(CSS).css
	multimarkdown $(DOCUMENT).md >$@
