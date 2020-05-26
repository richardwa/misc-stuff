#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REMOTE_DIR="~/misc-stuff/esp8266clock/"

# local build
cd $DIR
pio run 

if [ $? -ne 0 ]; then
  echo failed build
  exit 1
fi


# send binary
scp $DIR/.pio/build/nodemcuv2/firmware.bin rich@silverhawk.local:$REMOTE_DIR/.pio/build/nodemcuv2/firmware.bin
scp $DIR/platformio.ini rich@silverhawk.local:$REMOTE_DIR/platformio.ini

# invoke upload on remote
ssh -t rich@silverhawk "cd $REMOTE_DIR; ~/.platformio/penv/bin/pio run --target upload --target monitor;"