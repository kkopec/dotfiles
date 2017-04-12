#!/usr/bin/env bash

usage() {
    echo "grep directory - looks for a pattern within a directory"
    echo ""
    echo "Usage: $(basename "$0") [go] <gp> <fd> [fi]"
    echo "Options:"
    echo "   -go,    --grep-options  grep search options"
    echo "   -gp,    --grep-pattern  grep search pattern"
    echo "   -fd,    --find-dir      find outer directory"
    echo "   -fi,    --find-inner    find inner directory"
    echo ""

    exit 1
}

while [[ $# > 0 ]]; do
    arg="$1"
    case $arg in
        -go|--grep-options)
            GREP_OPT=$2
            shift
            ;;
        -gp|--grep-pattern)
            GREP_PATT=$2
            shift
            ;;
        -fd|--find-dir)
            FIND_DIR=$2
            shift
            ;;
        -fi|-find-inner)
            FIND_INNER=$2
            shift
            ;;
        *)
            usage
            ;;
    esac
    shift
done

[[ ! $FIND_DIR || ! $GREP_PATT ]] && usage

ODIR=$(find . -mindepth 1 -maxdepth 1 -type d -name "*$FIND_DIR*" -print -quit) || usage
find $ODIR \
    -mindepth 1 -type d \
    ! -path "*.git/*" ! -path "*node_modules/*" \
    -name "*$FIND_INNER*" \
    -exec grep --color=always -Irn $GREP_OPT $GREP_PATT {} \; \
    | sort -n | uniq  || usage

