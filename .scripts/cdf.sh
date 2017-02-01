#!/bin/bash

usage() {
    echo -e "\nchange directory - changes cwd to a directory located within another directory"
    echo    "Usage: $(basename "$0") <fd> <fid>"
    echo    "Params: <fd>  - find directory"
    echo -e "        <fid> - find inner directory\n"
    exit 1
}

cd $(find $1 -type d -name "*$2*" -print -quit) || usage
