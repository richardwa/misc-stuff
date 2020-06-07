#!/bin/bash

# install to server, run installer as root
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

INSTALL_LOCATION=/etc/garage-door
LOG=/var/log/garage-status.log

cp -r "$DIR" $INSTALL_LOCATION

cat <<EOF > /etc/cron.d/garage-status
# check every minute
* * * * * root $INSTALL_LOCATION/check-status.sh >> $LOG 2>&1
EOF

service cron reload

tail -f $LOG