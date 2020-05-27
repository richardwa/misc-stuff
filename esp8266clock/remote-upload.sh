#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REMOTE_DIR="~/misc-stuff/esp8266clock/"

cd $DIR
rsync -atv --exclude '.*' . rich@silverhawk.local:$REMOTE_DIR


# invoke upload on remote
ssh -t rich@silverhawk "cd $REMOTE_DIR; ~/.platformio/penv/bin/pio run --target upload --target monitor;"