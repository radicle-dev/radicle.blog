PAGES    := docs/index.html docs/towards-decentralized-code-collaboration.html docs/radicle-link.html docs/collaborating-on-radicle.html docs/integrating-with-ethereum.html docs/introducing-rad.html docs/announcing-the-seeders-program.html docs/downloads.html docs/terms.html docs/privacy.html
PARTIALS := $(shell ls partials/* | sed 's/^/-p /')

build: $(PAGES) $(BLOG)

docs/%.html: pages/%.html.mustache partials/*
	echo {} | mustache /dev/stdin $< $(PARTIALS) > $@

clean:
	rm $(PAGES)

dependencies:
	npm install -g mustache

.PHONY: clean
