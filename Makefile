.DEFAULT_GOAL := help

.PHONY: help init apply update diff status

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

init: ## Initialize and apply dotfiles on a new machine
	@if ! command -v chezmoi >/dev/null 2>&1; then \
		echo "Installing chezmoi..."; \
		sh -c "$$(curl -fsLS get.chezmoi.io)"; \
	fi
	chezmoi init --apply --source $(shell pwd)

apply: ## Apply dotfiles to your home directory
	chezmoi apply -v

update: ## Pull latest changes and apply
	chezmoi update -v

diff: ## Show pending changes
	chezmoi diff

status: ## Show status of managed files
	chezmoi status
