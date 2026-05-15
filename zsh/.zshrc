# ================================
# Homebrew
# ================================
# Set PATH, MANPATH, etc., for Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ================================
# Oh My Zsh
# ================================
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
plugins=()

source $ZSH/oh-my-zsh.sh

# ================================
# History
# ================================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ================================
# Zinit Plugin Manager
# ================================
if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
  command mkdir -p "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# plugin
zinit light zdharma-continuum/fast-syntax-highlighting     # 명령어 구문 강조
zinit light zsh-users/zsh-autosuggestions                  # 히스토리 기반 자동 완성
zinit light zsh-users/zsh-completions                      # 추가 자동 완성 정의

# Oh My Zsh Snippet (git alias 등)
zinit snippet OMZP::git
zinit snippet OMZP::ssh-agent

# ================================
# Programming & Runtime Env
# ================================
# asdf
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Java Home (asdf)
. ~/.asdf/plugins/java/set-java-home.zsh

# python poetry
export PATH=$HOME/.local/bin:$PATH

# Added by Antigravity
export PATH="/Users/cryoon/.antigravity/antigravity/bin:$PATH"



# ================================
# Tools
# ================================
# carapace
source <(carapace _carapace)

# fzf (퍼지 검색 - Ctrl+R로 히스토리 검색, Ctrl+T로 파일 검색)
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# zoxide (스마트 cd - cd 명령어를 zoxide로 대체)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# navi (cheat sheet - Ctrl+G로 명령어 검색)
if command -v navi &>/dev/null; then
  eval "$(navi widget zsh)"
fi

# ngrok
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# SCM Breeze - Claude Code 환경에서는 SCM Breeze 제외
if [[ -z "$CLAUDECODE" ]]; then
  [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
fi

# ================================
# SET ALIAS
# ================================
# Modern CLI
alias ls="lsd"
alias ll="lsd -la"
alias lt="lsd --tree"
alias cat="bat"
alias find="fd"
alias grep="rg"
alias top="btop"
alias df="duf"
alias du="dust"
alias vim="nvim"
alias vi="nvim"

# 빠른 접근
alias lg="lazygit"      # Git TUI
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."

alias ip="curl ifconfig.me"         # 외부 IP 확인
alias ports="lsof -i -P -n"         # 열린 포트 확인
alias reload="exec zsh"             # zsh 리로드
alias zshrc="code ~/.zshrc"         # zshrc 편집

# ================================
# Treminal Tab Title
# ================================
DISABLE_AUTO_TITLE="true"
precmd() { echo -ne "\033]0;${PWD/#$HOME/~}\007" }
preexec() { echo -ne "\033]0;$1 (${PWD/#$HOME/~})\007" }

# ================================
# starship
# ================================
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
eval "$(starship init zsh)"

# ================================
# neofetch is deprecat
# fastfetch - It looks good to me! (인터랙티브 셸에서만)
# ================================
if [[ $- == *i* ]] && command -v fastfetch &>/dev/null; then
  fastfetch
fi