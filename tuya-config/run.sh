#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
tail -n 5000 /home/public/mqtt.log | $DIR/parse-log.py | $DIR/plot.sh
