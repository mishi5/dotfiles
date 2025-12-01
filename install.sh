#!/bin/bash

# dotfilesインストールスクリプト

set -e

# 色の定義
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== dotfiles setup ===${NC}"

# dotfilesディレクトリのパス
DOTFILES_DIR="$HOME/dotfiles"

# バックアップディレクトリ
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# バックアップを作成する関数
backup_if_exists() {
    if [ -f "$1" ] || [ -L "$1" ]; then
        echo -e "${BLUE}Backing up: $1${NC}"
        mkdir -p "$BACKUP_DIR"
        mv "$1" "$BACKUP_DIR/"
    fi
}

# シンボリックリンクを作成する関数
create_symlink() {
    local source="$1"
    local target="$2"
    
    backup_if_exists "$target"
    
    echo -e "${GREEN}Creating symlink: $target -> $source${NC}"
    ln -sf "$source" "$target"
}

# .zshrc
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# .gitconfig
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# starship.toml
mkdir -p "$HOME/.config"
create_symlink "$DOTFILES_DIR/config/starship.toml" "$HOME/.config/starship.toml"

# SSH config（存在する場合）
if [ -f "$DOTFILES_DIR/ssh/config" ]; then
    mkdir -p "$HOME/.ssh"
    create_symlink "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"
fi

echo -e "${GREEN}=== Setup complete! ===${NC}"
echo -e "${BLUE}Backup saved to: $BACKUP_DIR${NC}"
echo -e "${BLUE}Please restart your terminal or run: source ~/.zshrc${NC}"
