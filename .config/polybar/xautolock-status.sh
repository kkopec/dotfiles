#!/bin/bash

status=$(xautolock -status | cut -d' ' -f 2)
[[ $status == "enabled" ]] && exit 0
exit 1 

