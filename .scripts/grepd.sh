#!/bin/bash

usage() {
    echo -e "\ngrep directory - looks for a pattern within a directory"
    echo    "Usage: $(basename "$0") [go] <gp> <fd> [fid]"
    echo    "Params: [go]  - grep options"
    echo    "        <gp>  - grep pattern"
    echo    "        <fd>  - find directory"
    echo -e "        [fid] - find inner directory - mandatory if passing 3 arguments\n"
    exit 1
}

case "$#" in
    2)
        GOPT=""
        GPAT=$1
        FDIR=$2
        FINN=""
        ;;
    3)
        GOPT=""
        GPAT=$1
        FDIR=$2
        FINN=$3
        ;;
    4)
        GOPT=$1
        GPAT=$2
        FDIR=$3
        FINN=$4
        ;;
    *)
        usage
esac

find $FDIR -type d -name "*$FINN*" -exec grep --color -Irn $GOPT $GPAT {} \; || usage
