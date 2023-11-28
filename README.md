# dotfile

My configs and settings (or themes...)

## 1. Clone repository

Clone this repository to your home directory

```bash
git clone <dotfile_url> $HOME/.dotfiles
```

## 2. Brewfiles

In macOS, you can use [Homebrew](https://brew.sh/) to install packages.
First, you need to [install Homebrew](https://brew.sh/). And if you want to install all the packages in the Brewfile, run the following command.

### 2.1. backup Brewfile

In your old computer, you can backup Brewfile.

```bash
brew bundle dump --file=$HOME/.dotfiles/Brewfile
```

### 2.2. install packages

In your new computer, you can install packages.

```bash
brew update
brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/Brewfile
brew cleanup
brew cask cleanup
```

## 2. Symlink files

### Global `.gitignore` and `.gitconfig`

```bash
[ ! -f $HOME/.gitconfig ] && ln -nfs $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
[ ! -f $HOME/.gitignore_global ] && ln -nfs $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
```

```bash
git config --global core.excludesfile $HOME/.gitignore_global
```

### Shell config `.bashrc` and `.zshrc`

```bash
[ ! -f $HOME/.bashrc ] && ln -nfs $HOME/.dotfiles/.bashrc $HOME/.bashrc
[ ! -f $HOME/.zshrc ] && ln -nfs $HOME/.dotfiles/.zshrc $HOME/.zshrc
```

### Starship.rs config

[Starship.rs](https://starship.rs/) is a cross-shell prompt for user.

```bash
[ ! -f $HOME/.config/starship.toml ] && ln -nfs $HOME/.dotfiles/.config/starship.toml $HOME/.config/starship.toml
```

```bash
[ ! -f $HOME/.config/starship.toml ] && ln -nfs $HOME/.dotfiles/.config/nerd-font-symbols.toml $HOME/.config/nerd-font-symbols.toml
```

### SSH files

```bash
[ ! -f $HOME/.ssh/config ] && ln -nfs $HOME/.dotfiles/.ssh/config $HOME/.ssh/config
```
