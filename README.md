# dotfiles

My dotfiles for macOS, managed by [chezmoi](https://www.chezmoi.io/) and using [zimfw](https://zimfw.sh/) as zsh framework.

## Quick Start (New Machine)

```bash
# Clone and setup
git clone https://github.com/yurakawa/dotfiles ~/dotfiles
cd ~/dotfiles
./scripts/link.sh
```

Or with chezmoi directly:

```bash
chezmoi init yurakawa/dotfiles --apply
```

## Manual Installation

```bash
# Clone this repository
git clone https://github.com/yurakawa/dotfiles
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
