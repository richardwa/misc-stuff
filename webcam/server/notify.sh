
#Detect the name of the display in use
tty=`cat /sys/class/tty/tty0/active`

#Detect the user using such display
user=$(who | grep $tty | awk '{print $1}' | head -n 1)

#Detect the id of the user
uid=$(id -u $user)

echo $tty, $user, $uid
sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus notify-send "$@"
