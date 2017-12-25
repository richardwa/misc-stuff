use <util.scad>

$fn=64;

r= 19;// diameter 40;
h= 7; //height
t= 2; //thickness
l=3;  //lip
hole = 2;

inf=100; //infinity



difference(){
    union(){
        cylinder(h,r,r);
        cylinder(t,r+l,r+l+1);
    }
    translate([0,0,t]) cylinder(h,r-t,r-t);

    //make holes
    for (i=concat(ngon(6,r/3),[[0,0,0]])) 
        translate(i) cylinder(inf,hole,hole, center=true);

    for (i=ngon(12,r*2/3)) 
        translate(i) cylinder(inf,hole,hole, center=true);
}
