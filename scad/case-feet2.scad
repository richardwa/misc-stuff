include <lib/util.scad>

$fn = 100;
r = 15;
t = 2;
h = 15;

difference(){
  union(){
    cylinder(4,r,r);
    linear_extrude(h, twist=45)
      for (i = ngon(6,r-t)) translate(i) circle(t);
      translate([0,0,h-4]) cylinder(4,r,r);
  }
  cylinder(h+1,2,2);
  translate([0,0,h-5]) cylinder(3,5,5);


}


