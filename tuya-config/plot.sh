#!/bin/bash
width=`tput cols`
params=$(cat <<-END
set term dumb nofeed $width 50;
set key autotitle;
set nokey;
set title "Power Monitor";

set xdata time;
set timefmt "%Y-%m-%d-%H:%M:%S";
set format x "%H:%S";

plot for [i=0:*] '-' index i using 1:2 with lines title columnheader(1);
END
)
# echo $params
gnuplot -p -e "$params" <&0
printf "\n\n"