export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/kkopec/.oh-my-zsh

# theme
ZSH_THEME="afowler2"
#ZSH_THEME="powerlevel9k/powerlevel9k"

DISABLE_AUTO_UPDATE="true"

plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration
export KEYTIMEOUT=1
export EDITOR='vim'

source .functions
source .aliases
[ -f .localcfg ] && source .localcfg

zle -N zle-line-init
zle -N zle-keymap-select
