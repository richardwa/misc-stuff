#!/bin/bash

# find current tty
tty=`cat /sys/class/tty/tty0/active`

# find the user of the tty
user=$(who | grep $tty | awk '{print $1}' | head -n 1)

# get display of user
display=`ps -fu $user | grep -o "/etc/X11/xinit/xserverrc :." | cut -d: -f2`

#Detect the id of the user
uid=$(id -u $user)

echo $tty, $user, $display, $uid

sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus notify-send "$@"
