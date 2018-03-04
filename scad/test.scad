use<util.scad>;
$fn = 60;

minkowski() {
  difference() {
    cylinder(10, 10, 10, center = true);
    cylinder(11, 8, 8, center = true);
  }
  sphere(r = 1);
}

/*
fillet(r = 2, steps = 5) {
  cylinder(r = 5, h = 10);
  cube([ 10, 10, 2 ]);
  rotate([ 30, 30, 30 ]) cylinder(r = 1.0, h = 50, center = true);
}*/