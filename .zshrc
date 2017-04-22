export ZSH=$HOME/.oh-my-zsh

# theme
ZSH_THEME="afowler2-custom"
#ZSH_THEME="powerlevel9k/powerlevel9k"

DISABLE_AUTO_UPDATE="true"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration
source $HOME/.env

source $HOME/.functions
source $HOME/.aliases
[ -f $HOME/.localcfg ] && source $HOME/.localcfg

zle -N zle-line-init
zle -N zle-keymap-select
