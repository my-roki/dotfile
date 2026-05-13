#!/bin/bash

set -e

echo "🚀 Setting up dotfiles..."

# ================================
# Homebrew
# ================================
if ! command -v brew &>/dev/null; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "✅ Homebrew already installed"
fi

# ================================
# Stow
# ================================
if ! command -v stow &>/dev/null; then
  echo "📦 Installing stow..."
  brew install stow
else
  echo "✅ Stow already installed"
fi

# ================================
# Symlinks
# ================================
echo "🔗 Creating symlinks..."

cd "$(dirname "$0")"

stow ghostty
stow git
stow ssh
stow starship
stow vscode
stow zsh

echo ""
echo "✅ Done!"
echo ""
echo "⚠️  Don't forget to create ~/.gitconfig.local:"
echo ""
echo '    cat > ~/.gitconfig.local << EOF'
echo '    [user]'
echo '        name = Your Name'
echo '        email = your@email.com'
echo '    EOF'
