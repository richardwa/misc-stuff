#!/bin/bash
# this files runs as root when triggered by acpi events

echo "args: $@" >> /tmp/power.log
export XAUTHORITY=/run/user/1000/gdm/Xauthority
export DISPLAY=:2
MONITOR=DP-0 

function toggle() {
    if xrandr --listmonitors | grep "$MONITOR"; then
        echo power off
        xrandr --output "$MONITOR" --off
    else
        echo power on
        xrandr --output "$MONITOR" --auto
    fi
}

# disable for now, turning back on does not work
# toggle |& tee -a /tmp/power.log
