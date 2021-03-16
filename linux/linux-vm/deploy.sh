#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [[ $EUID -eq 0 ]]; then
    # is root user execute for real
    rsync "-rv" $DIR/root/* /
    update-initramfs -u
    update-grub
else
    # do dry run
    rsync "-nrv" $DIR/root/* /
fi
