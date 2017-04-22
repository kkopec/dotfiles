#!/bin/bash
#
# .dotfiles installation script
#

function usage() {
    echo ""
    echo ".dotfiles installation script"
    echo "Usage: $(basename "$0") [-bp]"
    echo "Options:"
    echo "    -b,   --backup    back existing files up in other directory"
    echo "    -c,   --core      installs core dotfiles"
    echo "    -h,   --help      shows this help instructions"
    echo "    -p,   --plug      installs/updates vim plugins"
    echo "    -v,   --verbose   makes the output more verbose"
    echo "    -x,   --xfiles    installs x related files"
    echo ""

    exit 1
}

set -e

BACKDIR=$HOME/.backup
DOTDIR=$(dirname $(readlink -f $0))

[ $# -eq 0 ] && usage
while [[ $# > 0 ]]; do
    arg="$1"
    case $arg in
        -b|--backup)
            BACKUP=1
            ;;
        -c|--core)
            CORE=1
            ;;
        -p|--plug)
            PLUG=1
            ;;
        -v|--verbose)
            VERBOSE=1
            ;;
        -x|--xfiles)
            XFILES=1
            ;;
        *)
            usage
            ;;
    esac
    shift
done

#TODO: refactor & clean up
function backup() {
    mkdir -p $BACKDIR

    for item in $(ls -A -I '.oh-my-zsh' -I '.git' -I 'install.sh' $DOTDIR) ; do
        node=$HOME/$item
        if [ -L $node ] ; then
            node_path=$(readlink -f $node)
            if [[ ! $node_path =~ $DDIR ]] ; then
                cp -r $node $BACKDIR
                [ $VERBOSE ] && echo "symlink $item backed up"
            fi
        elif [ -f $node ] ; then
            cp $node $BACKDIR
            [ $VERBOSE ] && echo "file $item backed up"
        elif [ -d $node ] ; then
            mkdir -p $BACKDIR/$item
            for it in $(ls -A $item) ; do
                if [ -e $node/$it ] ; then
                    cp -r $node/$it $BACKDIR/$item
                    rm -rf $node/$it
                fi
            done
            [ $VERBOSE ] && echo "directory $item backed up"
        fi
    done
}

function link_core() {
    theme_dir=".oh-my-zsh/custom/themes"

    ln -sf $DOTDIR/.aliases     $HOME
    ln -sf $DOTDIR/.env         $HOME
    ln -sf $DOTDIR/.functions   $HOME
    ln -sf $DOTDIR/.scripts     $HOME
    ln -sf $DOTDIR/.vimrc       $HOME
    ln -sf $DOTDIR/.zshrc       $HOME
    ln -sf $DOTDIR/$theme_dir/* $HOME/$theme_dir

    [ -f $DOTDIR/.localcfg ] && ln -sf $DOTDIR/.localcfg $HOME
}

function link_xfiles() {
    ln -sf $DOTDIR/.config/*    $HOME/.config
    ln -sf $DOTDIR/.locker.sh   $HOME
    ln -sf $DOTDIR/.wallpapers  $HOME
    ln -sf $DOTDIR/.xprofile    $HOME
    ln -sf $DOTDIR/.Xresources  $HOME
}

function vim_plug() {
    vim +PlugUpdate
    [ $VERBOSE ] && echo "vim plugins installed"
}


[ $VERBOSE ] && echo "Installing dotfiles..."
[ $BACKUP ]  && backup
[ $CORE ]    && link_core
[ $XFILES ]  && link_xfiles
[ $PLUG ]    && vim_plug

