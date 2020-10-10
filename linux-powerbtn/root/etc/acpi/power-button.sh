#!/bin/bash
# this files runs as root when triggered by acpi events
echo power button pressed >> /tmp/power.log

display=DP-0

if xrandr | grep "$display disconnected"; then
    xrandr --output "$display" --auto
else
    xrandr --output "$display" --off 
fi
