#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# do dry run
args="-nrv"

if [[ $EUID -eq 0 ]]; then
    # is root user execute for real
    args="-rv"
    rm /etc/udev/rules.d/72-*
fi
rsync $args $DIR/root/* /

if [[ $EUID -eq 0 ]]; then
    udevadm control --reload-rules
    udevadm trigger
fi