#!/bin/zsh

# This script is deprecated. Use chezmoi instead.
# For new setup, run: chezmoi init yurakawa/chezmoi-dotfiles && chezmoi apply

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Link dotfiles (legacy method, prefer chezmoi)
for dotfile in ${DOTFILES_DIR}/.??* ; do
    [[ "$dotfile" == "${DOTFILES_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.github" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.DS_Store" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.gitmodules" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
done

# Karabiner config
mkdir -p "${HOME}/.config/karabiner"
ln -fnsfv "${DOTFILES_DIR}/karabiner.json" "${HOME}/.config/karabiner"

# zimfw installation (if not already installed)
if [[ ! -d "${HOME}/.zim" ]]; then
    echo "Installing zimfw..."
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
fi

