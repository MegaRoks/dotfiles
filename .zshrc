# ===== Oh My Zsh Configuration =====
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins (only built-in ones)
plugins=(
    git
    docker
    docker-compose
    nvm
    npm
    node
    yarn
)

source $ZSH/oh-my-zsh.sh

# ===== PATH =====
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# ===== Node.js / NVM =====
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# NVM auto-use
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# ===== CUSTOM ALIASES =====

# General
alias c="clear"
alias reload="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias -- -="cd -"

# Utilities
alias myip="curl ifconfig.me"
alias ports="lsof -i -P -n | grep LISTEN"
alias sizeof="du -sh"

# ===== HISTORY CONFIGURATION =====
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

# ===== ENVIRONMENT VARIABLES =====
export EDITOR="code"
export VISUAL="code"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# ===== CUSTOM SETTINGS =====
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

