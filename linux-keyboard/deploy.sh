#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# do dry run
args="-nrv"

if [[ $EUID -eq 0 ]]; then
    # is root user execute for real
    args="-rv"
fi
rsync $args $DIR/root/* /
setxkbmap -layout us
