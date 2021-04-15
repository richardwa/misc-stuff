#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ $EUID -eq 0 ]]; then
    rm /etc/udev/rules.d/72*
    udevadm control --reload-rules
    udevadm trigger
else
    echo root required
fi