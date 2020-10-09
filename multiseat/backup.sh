#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp /etc/udev/rules.d/72* $DIR/root/etc/udev/rules.d/