.PHONY: all
all: bin dotfiles ## Installs the bin files and the dotfiles.

.PHONY: bin
bin: ## Installs the bin directory files.
	# add aliases for things in bin
	for file in $(shell find $(CURDIR)/bin -type f -not -name "*-backlight" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done

.PHONY: dotfiles
dotfiles: ## Installs the dotfiles.
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".travis.yml" -not -name ".git" -not -name ".*.swp" -not -name ".gnupg"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

	ln -fn $(CURDIR)/gitignore $(HOME)/.gitignore;
	git update-index --skip-worktree $(CURDIR)/.gitconfig;

	mkdir -p $(HOME)/.config;
	ln -snf $(CURDIR)/i3 $(HOME)/.config;
	# ln -snf $(CURDIR)/i3blocks $(HOME)/.config;
	ln -snf $(CURDIR)/i3blocks-contrib $(HOME)/.config;
	ln -snf $(CURDIR)/i3lock-color $(HOME)/.config;

	mkdir -p $(HOME)/.local/share;
	ln -snf $(CURDIR)/.fonts $(HOME)/.local/share/fonts;

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
