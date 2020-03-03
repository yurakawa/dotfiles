#!/bin/sh

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    rm ~/$f
    ln -sf ~/dotfiles/$f ~/$f
done
