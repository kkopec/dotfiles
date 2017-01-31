#!/bin/bash
# changes cwd to a directory located within another directory
# usage:
# cddir.sh <find main dir> <find dir>
cd $(find $1 -type d -name "*$2*" -print -quit)
