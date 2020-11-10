#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
file=${1%.curv}
filename=${file##*/}
/curv/release/curv.exe -o $DIR/target/$filename.stl -O jit $1