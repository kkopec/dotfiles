#!/usr/bin/env sh

status=$(xautolock -status | cut -d' ' -f 2)
[[ $status == "disabled" ]] && exit 0 || exit 1 

