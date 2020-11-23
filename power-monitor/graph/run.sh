#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
tail -n 1000 /home/developer/misc-stuff/power-monitor/logs/power.log | $DIR/parse-log.py | $DIR/plot.sh
