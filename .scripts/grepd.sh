#!/bin/bash

show_help() {
    echo "grep directory usage:"
    echo -e "$0 [grep_option] <grep_pattern> <find_dir> [inner_find_dir]\n"
}

case "$#" in
    2)
        GPAT=$1
        FDIR=$2
        GOPT=""
        FINN=""
        ;;
    3)
        GOPT=$1
        GPAT=$2
        FDIR=$3
        FINN=""
        ;;
    4)
        GOPT=$1
        GPAT=$2
        FDIR=$3
        FINN=$4
        ;;
    *)
        show_help
        exit 1
esac

find $FDIR -type d -name "*$FINN*" -exec grep --color -Irn $GOPT $GPAT {} \;

exit
