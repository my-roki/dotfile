# dotfiles

My personal development environment configuration files.
Managed with [GNU Stow](https://www.gnu.org/software/stow/) to quickly set up a consistent environment on any new machine.

## Structure

```
~/.dotfiles/
├── ghostty/        # Ghostty terminal config
├── git/            # .gitconfig, .gitignore_global
├── ssh/            # .ssh/config
├── starship/       # starship.toml, nerd-font-symbols.toml
├── vscode/         # settings.json, keybindings.json
├── zsh/            # .zshrc
├── install.sh      # Setup script
└── README.md
```

## How It Works

This repo uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks.
Each folder mirrors the structure of the home directory (`~`),
so running `stow <folder>` automatically creates symlinks in the correct locations.

Example:
```
~/.dotfiles/zsh/.zshrc
    ↓ stow zsh
~/.zshrc (symlink)
```

## Quick Start

```bash
git clone <repo_url> ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Manual Setup

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone the Repository

```bash
git clone <repo_url> ~/.dotfiles
```

### 3. Install Stow

```bash
brew install stow
```

### 4. Create Symlinks

```bash
cd ~/.dotfiles
stow ghostty
stow git
stow ssh
stow starship
stow vscode
stow zsh
```

### 5. Install Packages

Dump the current package list on your old machine:
```bash
brew bundle dump --file=~/.dotfiles/Brewfile
```

Install on the new machine:
```bash
brew bundle --file=~/.dotfiles/Brewfile
```

### 6. Set Up Sensitive Information

Git user info is not included in this repo. Set it up manually:
```bash
cat > ~/.gitconfig.local <<-EOF
[user]
    name = Your Name
    email = your@email.com
EOF
```

## Configuration Files

| File | Description |
|------|-------------|
| `zsh/.zshrc` | zsh config, plugins, and aliases |
| `starship/starship.toml` | Terminal prompt theme |
| `git/.gitconfig` | Global git config |
| `git/.gitignore_global` | Global git ignore rules |
| `ssh/config` | SSH host config |
| `ghostty/config` | Ghostty terminal config |
| `vscode/settings.json` | VSCode / Antigravity settings |
| `vscode/keybindings.json` | VSCode / Antigravity keybindings |

## Notes

- `~/.gitconfig.local` — Contains git user info (sensitive, not tracked by git)
- `~/.ssh/id_rsa` — SSH private key (never commit this!)
