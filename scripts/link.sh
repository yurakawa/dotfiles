#!/bin/zsh

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Setup chezmoi to use this dotfiles directory
if [[ ! -L "${HOME}/.local/share/chezmoi" ]]; then
    echo "Setting up chezmoi..."
    mkdir -p "${HOME}/.local/share"
    ln -sfn "${DOTFILES_DIR}" "${HOME}/.local/share/chezmoi"
fi

# Install chezmoi if not installed
if ! command -v chezmoi &> /dev/null; then
    echo "Installing chezmoi..."
    brew install chezmoi || sh -c "$(curl -fsLS get.chezmoi.io)"
fi

# Apply dotfiles using chezmoi
echo "Applying dotfiles with chezmoi..."
chezmoi apply -v

# zimfw installation (if not already installed)
if [[ ! -d "${HOME}/.zim" ]]; then
    echo "Installing zimfw..."
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
fi

echo "Done!"

