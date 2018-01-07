use<util.scad>;

fillet(r=2,steps=5) {
	cylinder(r=5,h=10);
	cube([10,10,2]);
	rotate([30,30,30]) cylinder(r=1.0,h=50,center=true);
}