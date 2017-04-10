#!/bin/bash

SCRIPT_NAME="${(%):-%N}"
usage() {
    echo ""
    echo "change directory - changes cwd to a directory located within another directory"
    echo "Usage: $(basename $SCRIPT_NAME) <fd> [fi]"
    echo "Params:" 
    echo "  <fd>    find top level directory"
    echo "  [fi]    find inner directory"
    echo ""
}

[ $# -eq 0 ] && usage && return 1
OUTER_DIR=$(find . -mindepth 1 -maxdepth 1 -type d -name "*$1*" -print -quit) || return 1
INNER_DIR=$(find $OUTER_DIR -type d -name "*$2*" -print -quit) || return 1
cd $INNER_DIR

