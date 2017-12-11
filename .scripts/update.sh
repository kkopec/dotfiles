#!/usr/bin/env bash

COMMAND=head
N=10

while [[ $# > 0 ]]; do
    arg="$1"
    case $arg in
        -h|--head)
            COMMAND=head
            N=$2
            shift
            ;;
        -t|--tail)
            COMMAND=tail
            N=$2
            shift
            ;;
        *)
            N=$arg
            ;;
    esac
    shift
done

pacman -Quq | $COMMAND -n $N | xargs sudo pacman -S --noconfirm

