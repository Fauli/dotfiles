#!/bin/bash

# 🚀 Neovim Config Installation Script
# This script installs NvChad and overwrites it with your custom config.

set -e  # Exit on error
DOTFILES_DIR="$HOME/git/dotfiles"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_DATA_DIR="$HOME/.local/share/nvim"
NVIM_CACHE_DIR="$HOME/.cache/nvim"

echo "🚀 Cleaning existing Neovim configuration..."

# 🗑 Remove old Neovim configuration, cache, and data
rm -rf "$NVIM_CONFIG_DIR"
rm -rf "$NVIM_DATA_DIR"
rm -rf "$NVIM_CACHE_DIR"

echo "✅ Cleaned old Neovim configuration."

# 🛠 Clone NvChad into Neovim config directory
echo "🔄 Installing NvChad..."
git clone --depth=1 https://github.com/NvChad/NvChad "$NVIM_CONFIG_DIR"

# 📂 Overwrite with your custom configuration
echo "🔁 Copying custom Neovim configuration from dotfiles..."
cp -r "$DOTFILES_DIR/nvim/"* "$NVIM_CONFIG_DIR/"

# 📦 Ensure plugins are up to date
echo "🔄 Running Neovim to install plugins..."
nvim --headless +"Lazy sync" +q

echo "✅ Neovim setup complete! 🚀"
echo "🎯 Start Neovim by running: nvim"

