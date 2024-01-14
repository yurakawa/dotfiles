#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

for dotfile in ${DOTFILES_DIR}/.??* ; do
    [[ "$dotfile" == "${DOTFILES_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.github" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.DS_Store" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
done

ln -fnsfv "${DOTFILES_DIR}/karabiner.json" "$HOME/.config/karabiner"
