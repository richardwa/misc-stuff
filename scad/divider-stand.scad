
$fn = 75;

w = 21;
h = 25;
l = 25;

t= 4;

fl = 160;

infinity = 1000;

rotate([0,90,0])
union(){

difference(){
    rotate([90,0,0])
    linear_extrude(l+2*t, center=true)
    minkowski(){
    square([w,h], center=true);
    circle(t);
    }

    translate([-infinity/2,-l/2,-h/2])
    cube([infinity,l,infinity]);
}

translate([-w/2,-fl/2,-h/2-t])
linear_extrude(t)
minkowski(){
    square([w,fl]);
    circle(t);
}

}
