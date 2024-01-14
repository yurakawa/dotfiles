DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all: init defaults link brew goinstall

# Set initial preference.
init:
	@echo "\033[0;34mRun init.sh\033[0m"
	@sh ./scripts/init.sh
	@echo "\033[0;34mDone.\033[0m"

brew: ## Run brew bundle
	@echo "\033[0;34mInstall brew\033[0m"
	@sh ./scripts/brew.sh
	@echo "\033[0;34mDone.\033[0m"

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

defaults: ## Set macOS system preferences
	@echo "\033[0;34mSet macOS system preferences\033[0m"
	@sh ./scripts/defaults.sh
	@echo "\033[0;34mDone.\033[0m"

link: # Link dotfiles.
	@echo "\033[0;34mLink dotfiles\033[0m"
	@sh ./scripts/link.sh
	@echo "\033[0;34mDone.\033[0m"

goinstall:
	@echo "\033[0;34mInstall go modules\033[0m"
	@sh ./scripts/goinstall.sh
	@echo "\033[0;34mDone.\033[0m"

clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
