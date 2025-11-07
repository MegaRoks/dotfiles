#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

echo "🚀 Installing dotfiles..."

# Backup and create symbolic link for .zshrc
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "📦 Backing up existing .zshrc"
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
fi
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Backup and create symbolic link for scripts directory
if [ -d "$HOME/scripts" ] && [ ! -L "$HOME/scripts" ]; then
    echo "📦 Backing up existing scripts directory"
    mv "$HOME/scripts" "$HOME/scripts.backup.$(date +%Y%m%d_%H%M%S)"
fi
ln -sf "$DOTFILES_DIR/scripts" "$HOME/scripts"

# Make all scripts executable
chmod +x "$DOTFILES_DIR/scripts"/*

echo "✅ Dotfiles installed!"
echo "🔄 Run: source ~/.zshrc"
