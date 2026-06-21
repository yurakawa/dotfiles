#!/bin/bash

set -e

echo "🚀 Starting macOS initial setup..."

# Install Xcode Command Line Tools if not installed
if ! xcode-select -p &> /dev/null; then
    echo "📦 Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "⏳ Please complete the Xcode installation and run 'chezmoi apply' again."
    exit 0
fi

# Create vim tmp directory
mkdir -p ~/.vim/tmp

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

echo "✅ Initial setup complete!"
