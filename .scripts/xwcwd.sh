#!/usr/bin/env bash

AWND=$(xprop -root _NET_ACTIVE_WINDOW | cut -d' ' -f5)
APID=$(xprop -id $AWND _NET_WM_PID | cut -d' ' -f3)
SPID=$(pgrep -P $APID zsh)
SCWD=$(readlink -e /proc/$SPID/cwd)
echo $SCWD

