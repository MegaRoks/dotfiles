#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

echo "🚀 Installing dotfiles..."

# Create symbolic link for .zshrc
if [ -f "$HOME/.zshrc" ]; then
    echo "📦 Backing up existing .zshrc"
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Create symbolic link for scripts
if [ -d "$HOME/scripts" ]; then
    echo "📦 Backing up existing scripts directory"
    mv "$HOME/scripts" "$HOME/scripts.backup"
fi
ln -sf "$DOTFILES_DIR/scripts" "$HOME/scripts"

# Make all scripts executable
chmod +x "$DOTFILES_DIR/scripts"/*

echo "✅ Dotfiles installed!"
echo "🔄 Run: source ~/.zshrc"
