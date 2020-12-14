#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
QMK_HOME=~/qmk_firmware

rm -rf $QMK_HOME/keyboards/
rsync -rv $DIR/root/* $QMK_HOME

qmk compile -kb jj40 -km rich
cp $QMK_HOME/jj40_rich.hex $DIR
cp $QMK_HOME/jj40_rich.hex /home/public/developer

qmk compile -kb teensy -km rich
cp $QMK_HOME/teensy_rich.hex $DIR
cp $QMK_HOME/teensy_rich.hex /home/public/developer

echo "flash with: qmk flash -kb <jj40|teensy> -km rich"
