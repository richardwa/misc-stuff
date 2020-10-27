#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rm -rf ~/qmk_firmware/keyboards/
rsync -rv $DIR/root/* ~/qmk_firmware/

echo do: qmk flash -kb jj40 -km rich
echo do: qmk flash -kb teensy -km rich