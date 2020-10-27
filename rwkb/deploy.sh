#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rsync -rv $DIR/root/* ~/qmk_firmware/
qmk flash -kb jj40 -km rich