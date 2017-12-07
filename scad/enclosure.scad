include <Rounded_Cube/cubeX.scad>

id = [10,10,10]; // inner dimesions
t = 2; //thickness

difference(){
    cubeX(id, center=true);
    translate([0,0,t])
    cubeX(id - [t,t,t], center=true);
    translate([id[0],id[1],0]
    cube(id);
}

