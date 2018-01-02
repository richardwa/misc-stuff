$fn=64;

r = 10;
infinity = 50;
rotate([180,0,0])
difference(){

union(){

cylinder(r,0,r);
translate([0,0,2*r]) sphere(r*pow(2,1/2));
}

translate([-infinity/2,-infinity/2,2.5*r])
cube(infinity);

translate([0,0,r/2])
cylinder(infinity,1.25,1.25);
}