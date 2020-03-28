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
SHH_AGENT_TIMEOUT=5m

source $HOME/.env

source $HOME/.functions
source $HOME/.aliases
[ -f $HOME/.localrc ] && source $HOME/.localrc

zle -N zle-line-init
zle -N zle-keymap-select

# ssh agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent`
    ssh-add -t $SSH_AGENT_TIMEOUT
fi

# syntax highlight plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
