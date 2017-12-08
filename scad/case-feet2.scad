include <lib/util.scad>


linear_extrude(15, twist=90, $fn=100)
for (i = ngon(6,15)) translate(i) circle(2, $fn=100);
