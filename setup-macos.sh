#!/bin/bash

# macOS 初期設定スクリプト

echo "Setting up macOS preferences..."

# .DS_Storeをネットワークドライブに作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
echo "✓ .DS_Store disabled for network drives"

# .DS_StoreをUSBドライブに作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
echo "✓ .DS_Store disabled for USB drives"

# Finderで隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true
echo "✓ Show hidden files in Finder"

# Finderでパスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
echo "✓ Show path bar in Finder"

# Finderでステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
echo "✓ Show status bar in Finder"

# フォルダを先に表示
defaults write com.apple.finder _FXSortFoldersFirst -bool true
echo "✓ Show folders first in Finder"

# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "✓ Show all file extensions"

# Finderを再起動
killall Finder
echo "✓ Finder restarted"

echo ""
echo "macOS setup complete!"
