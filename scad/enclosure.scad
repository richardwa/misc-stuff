use <util.scad>;

$fn=64;
id = [10,10,10]; // inner dimesions
t = 2; //thickness

inf = 100;

difference(){
    cubeR(id, t);
    cubeR(id - [t,t,t], t);

    linear_extrude([0,0,inf])
        square(inf,inf, center=true);
    
}

module cubeR(box, radius){
    minkowski(){
        cube(box, center=true);
        sphere(radius);
    }
}
