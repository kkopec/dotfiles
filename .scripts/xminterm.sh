#!/usr/bin/env bash

set -x

TERM_EMULATOR=$TERMINALE

if [ ! -z $1 ]; then
    TERM_EMULATOR=$1
fi

PID=$(pgrep $TERM_EMULATOR)
NEW=0


if [ -z $PID ]; then
    $TERM_EMULATOR &
    PID="$!"
    disown -h "$PID"
    NEW=1
fi

WID=`xdotool search --sync --pid "$PID" | tail -1`
FOCUSED=`xdotool getwindowfocus`

if [ "$NEW" -eq 1 ]; then
    xdotool windowsize --sync "$WID" 1920 1080
    exit 0;
fi

if [ "$FOCUSED" != "$WID" ]; then
    xdotool windowactivate --sync "$WID"
else
    xdotool windowminimize --sync "$WID"
fi

exit 0

