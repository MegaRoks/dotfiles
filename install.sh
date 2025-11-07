#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

echo "🚀 Установка dotfiles..."

# Создать символическую ссылку для .zshrc
if [ -f "$HOME/.zshrc" ]; then
    echo "📦 Создаю бэкап существующего .zshrc"
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Создать символическую ссылку для scripts
if [ -d "$HOME/scripts" ]; then
    echo "📦 Создаю бэкап существующей папки scripts"
    mv "$HOME/scripts" "$HOME/scripts.backup"
fi
ln -sf "$DOTFILES_DIR/scripts" "$HOME/scripts"

# Сделать все скрипты исполняемыми
chmod +x "$DOTFILES_DIR/scripts"/*

echo "✅ Dotfiles установлены!"
echo "🔄 Выполните: source ~/.zshrc"
