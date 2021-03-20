TARGETS := dwl install dev deploy
.PHONY: $(TARGETS)

export HUGO_VERSION := 0.81.0

dwl:
	@curl -LO https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.deb

install: dwl
	@sudo dpkg -i hugo_$(HUGO_VERSION)_Linux-64bit.deb

dev:
	@hugo server --noHTTPCache --ignoreCache

deploy:
	@./scripts/deploy-gh-pages.sh
