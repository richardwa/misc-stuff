use <util.scad>;

$fn=64;
id = [20,40,10]; // inner dimesions
t = 10; //thickness

inf = 100;

difference(){
    cubeR(id + [0,0,id[2]], t);
    cubeR(id + [-t,-t,id[2]-t], t);

    linear_extrude([0,0,inf])
        square(inf,inf, center=true);
    
}

module cubeR(box, radius){
    minkowski(){
        cube(box, center=true);
        sphere(radius);
    }
}
