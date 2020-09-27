export HUGO_VERSION := 0.75.1

.PHONY: install
install:
	@curl -LO https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.deb
	@sudo dpkg -i hugo_$(HUGO_VERSION)_Linux-64bit.deb

.PHONY: deploy
deploy:
	@./scripts/deploy-gh-pages.sh
