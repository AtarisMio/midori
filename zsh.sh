#!/bin/bash -e

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cat << \EOF >> ~/zshrc
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

export ZSH="$HOME/.oh-my-zsh"

# Android sdk & tools
export ANDROID_HOME=/Users/bytedance/Library/Android/sdk
export PATH=$HOME/bin:/usr/local/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$PATH

ZSH_THEME="agnoster"
plugins=(
  git
  git-auto-fetch
)

if [ -f 'source /etc/profile.d/bash_profile.sh' ]; then
  source source /etc/profile.d/bash_profile.sh
fi

source $ZSH/oh-my-zsh.sh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


fpath=(~/.zsh $fpath)
rm -f "$HOME/.zcompdump"; autoload -U compinit; compinit

EOF