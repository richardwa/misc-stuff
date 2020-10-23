#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp /etc/fstab $DIR/root/etc/
cp /etc/default/grub $DIR/root/etc/default/
cp /etc/modprobe.d/blacklist-nvidia-nouveau.conf $DIR/root/etc/modprobe.d/