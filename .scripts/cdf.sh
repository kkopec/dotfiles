#!/usr/bin/env bash
#=====================================================================
#
# cdf - find and change directory
#
# DESCRIPTION
#   Changes cwd to a directory located within another directories.
#
# USAGE
#   cdf.sh DIR...
#
#     DIR     directory name (full of specific part)
#
#=====================================================================

SCRIPT_NAME="${(%):-%N}"
usage() {
    echo "cdf - find and change directory"
    echo "Usage: $(basename $SCRIPT_NAME) DIR..."
}

FDIR="."

find_dir(){
    FDIR=$(find $1 -mindepth 1 -maxdepth 1 -type d -name "*$2*" -print -quit)
}

find_inner(){
    FDIR=$(find $1 -type d -name "*$2*" -print -quit)
}

if [ $# -eq 0 ]; then
    usage >&2
    return 1
elif [ $# -eq 1 ]; then
    find_dir $FDIR $1
    [ ! $FDIR ] && return 2
else
    while [ $# -gt 1 ] ; do
        find_dir $FDIR $1
        [ ! $FDIR ] && return 2
        shift
    done
    find_inner $FDIR $1
    [ ! $FDIR ] && return 3
fi
cd $FDIR

