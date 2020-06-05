#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# designed for a run-level 3 ubuntu system
# users start at command line login, then use startx
# first user automatically signs in, then auto startx
# there is no gdm service

# find current tty
tty=`cat /sys/class/tty/tty0/active`

# find the user of the tty
user=$(who | grep $tty | awk '{print $1}' | head -n 1)

# get id of the user
uid=$(id -u $user)

echo $tty, $user, $uid
if [ -z "$user" ]; then
  sudo -u $user \
  XDG_RUNTIME_DIR=/run/user/$uid \
  paplay "$DIR/garage.mp3"
else
  # no active user, screen is on tty login prompt
  sudo aplay -D default:SoundBar -D default:SoundBar
fi


