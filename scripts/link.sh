#!/bin/zsh

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

ln -fnsfv "${DOTFILES_DIR}/prezto" "${ZDOTDIR:-$HOME}/.zprezto"
git submodule update --init --recursive
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -snf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for dotfile in ${DOTFILES_DIR}/.??* ; do
    [[ "$dotfile" == "${DOTFILES_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.github" ]] && continue
    [[ "$dotfile" == "${DOTFILES_DIR}/.DS_Store" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
done

ln -fnsfv "${DOTFILES_DIR}/karabiner.json" "${HOME}/.config/karabiner"

