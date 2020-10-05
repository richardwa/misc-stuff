#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
width=`tput cols`
params=$(cat <<-END
set term png;
set output '$DIR/out/power-usage.png';
set key autotitle;
set title "Power Monitor";
set datafile separator " ";

set xdata time;
set timefmt "%Y-%m-%d-%H:%M:%S";
set format x "%H:%M";

plot for [i=0:*] '-' using 1:2 with lines title columnheader(1);

END
)
gnuplot -p -e "$params" <&0 
printf "\n\n"