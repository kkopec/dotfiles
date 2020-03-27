export ZSH=$HOME/.oh-my-zsh

# theme
ZSH_THEME="afowler2-custom"
#ZSH_THEME="powerlevel9k/powerlevel9k"

DISABLE_AUTO_UPDATE="true"

plugins=(
    git 
    archlinux 
    colored-man-pages 
    encode64
)
source $ZSH/oh-my-zsh.sh

# User configuration
source $HOME/.env

source $HOME/.functions
source $HOME/.aliases
[ -f $HOME/.localcfg ] && source $HOME/.localcfg

zle -N zle-line-init
zle -N zle-keymap-select

# syntax highlight plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
