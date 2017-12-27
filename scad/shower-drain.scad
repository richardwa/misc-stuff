use <util.scad>

$fn=64;

r= 19.5;// diameter 40;
h= 7; //height
t= 2; //thickness
l=3;  //lip
hole = 6; //honeycomb hold corner to coner

inf=100; //infinity

//lip
difference(){
    union(){
        cylinder(h,r,r);
        cylinder(t,r+l,r+l+1);
    }

    translate([0,0,-1]) intersection() {
        hex_grid([2*r, 2*r, inf], hole, t/2);
        cylinder(inf,r-t,r-t);
    }
       
    translate([0,0,t]) cylinder(h,r-t,r-t);

}