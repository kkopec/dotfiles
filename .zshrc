export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# theme
ZSH_THEME="afowler2-custom"
#ZSH_THEME="powerlevel9k/powerlevel9k"

DISABLE_AUTO_UPDATE="true"

plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration
export KEYTIMEOUT=1
export EDITOR='vim'
export TERM=xterm-256color
export PYV=$(python -c 'import sys; print(sys.version_info[0])')

source .functions
source .aliases
[ -f .localcfg ] && source .localcfg

zle -N zle-line-init
zle -N zle-keymap-select
