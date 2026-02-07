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

```bash
# Clone this repository
git clone https://github.com/yurakawa/dotfiles ~/dotfiles
cd dotfiles

# Install dependencies
make all
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

## Legacy

Previously used [Prezto](https://github.com/sorin-ionescu/prezto). Migrated to zimfw for better performance.
