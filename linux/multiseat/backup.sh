#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cp /etc/udev/rules.d/72* $DIR/bak/etc/udev/rules.d/