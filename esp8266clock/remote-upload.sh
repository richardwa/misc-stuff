#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REMOTE_DIR="~/esp8266clock/"
REMOTE_HOST="pi@raspberrypi"

cd $DIR
scp firmware.bin $REMOTE_HOST:$REMOTE_DIR

# invoke upload on remote
ssh -t $REMOTE_HOST <<EOF
cd $REMOTE_DIR
esptool.py --before default_reset --after hard_reset --chip esp8266 --port "/dev/ttyUSB0" --baud 115200 write_flash 0x0 firmware.bin
EOF
