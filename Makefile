DOCUMENT = your_document_here
CSS = freistilbox

$(DOCUMENT).pdf: $(DOCUMENT).html $(CSS).css ../assets/header.html Makefile
	prince $< -o $@
	cp $@ ~/Google\ Drive/Marketing/freistilbox/Whitepaper/

$(CSS).css: $(CSS).scss
	sass $< >$@

$(DOCUMENT).html: $(DOCUMENT).md $(CSS).css
	multimarkdown $(DOCUMENT).md >$@
