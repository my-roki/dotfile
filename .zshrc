# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# A Note on Profiling with zsh/zprof
zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
plugins=(
  git
  # zsh-nvm # -> asdf로 대체 
  zsh-better-npm-completion
  zsh-autosuggestions
  zsh-syntax-highlighting
  autojump
)

source $ZSH/oh-my-zsh.sh

# Homebrew
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# neofetch is deprecat
# fastfetch - It looks good to me!
fastfetch

# starship
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
eval "$(starship init zsh)"

# # Java -> asdf로 대체
# export JAVA_HOME=$(/usr/libexec/java_home -v 17)
# export PATH="$JAVA_HOME:$PATH"

# alias set-java8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
# alias set-java11='export JAVA_HOME=$(/usr/libexec/java_home -v 11)'
# alias set-java17='export JAVA_HOME=$(/usr/libexec/java_home -v 17)'
# alias set-java='export JAVA_HOME=$(/usr/libexec/java_home)'

# # nvm -> zsh-nvm로 대체
# https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/\
# https://github.com/lukechilds/zsh-nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# python poetry
export PATH=$HOME/.local/bin:$PATH

# ngrok
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# asdf
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
# To set JAVA_HOME in your shell's initialization add the following:
# . ~/.asdf/plugins/java/set-java-home.bash
# For zsh shell, instead use:
. ~/.asdf/plugins/java/set-java-home.zsh


# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
