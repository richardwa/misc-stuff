
// clamp dimensions
rodsize=10/2-.2;
height=20;
thickness=2;
gap_degrees=30;

// base dimesions
base_thickness=3;
base_length=40;

$fn=100;

rotate([0,0,gap_degrees/2])
  rotate_extrude(angle= 360 - gap_degrees)
    translate([rodsize+thickness/2,0,0])
      square([thickness, height],center=true);

translate([-(base_thickness/2) - rodsize,0,0])
  difference(){
      cube([base_thickness,base_length,height], center=true);

    // holes
    rotate([0,90,0])
      translate([0,base_length/2-5,0])
        cylinder(r=2.5,h=base_thickness+1,center=true);

    rotate([0,90,0])
      translate([0,-base_length/2+5,0])
        cylinder(r=2.5,h=base_thickness+1,center=true);
  }
  