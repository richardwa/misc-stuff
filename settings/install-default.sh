#!/bin/bash
list="
#basics
tmux
subversion
vim

#basic dev tools
make
build-essential
gcc

#used for serial communication
socat

#arduino stuff
gdb-avr 
gcc-avr
avrdude

ghc
rsnapshot
"
echo -e "$list"
array=$(echo -e "$list"| grep -vE "^\s*#" | tr "\n" " ")
apt-get --assume-yes $@ install $array

