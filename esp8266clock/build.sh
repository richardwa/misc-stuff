#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pio run
cp $DIR/.pio/build/nodemcuv2/firmware.bin $DIR/