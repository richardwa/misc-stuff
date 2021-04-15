#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
journalctl -u power-monitor --no-pager | cut -d' ' -f6- | $DIR/parse-log.py | $DIR/plot.sh
