# dotfiles

My dotfiles for macOS, managed by [chezmoi](https://www.chezmoi.io/) and using [zimfw](https://zimfw.sh/) as zsh framework.

## Quick Start (New Machine)

```bash
# One command setup (recommended)
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply yurakawa/dotfiles
```

This will automatically:

1. Install Xcode Command Line Tools
2. Install Homebrew
3. Install packages from Brewfile
4. Configure macOS defaults
5. Install zimfw and plugins
6. Deploy all dotfiles

## Manual Installation

If you prefer to clone the repository manually:

```bash
# Clone this repository
git clone https://github.com/yurakawa/dotfiles.git ${HOME}/dotfiles
cd ${HOME}/dotfiles

# Install chezmoi if not already installed
# brew install chezmoi

# Initialize and apply the dotfiles from the current directory
chezmoi init --apply --source .
```

## What's Included

- **Zsh** with [zimfw](https://zimfw.sh/) - Fast, modular zsh framework
  - [pure](https://github.com/sindresorhus/pure) prompt
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - zsh-completions
- **Git** configuration
- **Vim/GVim** configuration
- **Tmux** configuration
- **Karabiner-Elements** configuration
- **Homebrew** bundle (`.Brewfile`)

## File Structure

```
~/.zshrc          # Main zsh config (zimfw)
~/.zimrc          # zimfw module configuration
~/.gitconfig      # Git configuration
~/.vimrc          # Vim configuration
~/.tmux.conf      # Tmux configuration
~/.config/karabiner/karabiner.json  # Karabiner config
```

## Managing Dotfiles

```bash
# Add a new file to chezmoi
chezmoi add ~/.config/some-config

# Edit a managed file
chezmoi edit ~/.zshrc

# See pending changes
chezmoi diff

# Apply changes
chezmoi apply

# Update from remote
chezmoi update
```

## Task Runner (Makefile)

This repository includes a `Makefile` to simplify common `chezmoi` workflows. You can run `make` or `make help` to see available commands:

```bash
make help    # Show available commands
make init    # Initialize and apply dotfiles on a new machine
make apply   # Apply changes to your home directory
make update  # Pull latest changes from remote and apply
make diff    # Show pending changes
make status  # Show status of managed files
```

## Setup (Manual Steps)

<!-- TODO: Document manual setup steps (e.g. Touch ID, SSH keys, etc.) -->

## Troubleshooting

<!-- TODO: Document common issues and their solutions -->
