include <Rounded_Cube/cubeX.scad>
table_thickness = 25;
thickness=3;
offset=8;

total=table_thickness+2*thickness;

difference(){
    cubeX(total,radius=thickness);
    
    translate([thickness,thickness,thickness])
    cube([table_thickness,total,total]);

//    translate([0,total,total])
//    rotate([0,90,0])
//    cylinder(total,r=table_thickness, center=true);
    
    translate([-total,thickness+offset,thickness+offset])
    cubeX([3*total,total,total],radius=2*thickness);
}
