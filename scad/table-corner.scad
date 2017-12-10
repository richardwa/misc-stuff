$fn=50;

table = 25; //table thickness
thickness=3; //thickness of the part
offset=12; 

total=table+2*thickness;
infinity = 1000;

difference(){
    minkowski(){
        cube(table, center=true);
        sphere(thickness);
    }
    
    translate([-table/2,-table/2,-table/2])
    cube([table,infinity,infinity]);
    
    translate([-total/2,-total/2+offset,-total/2+offset])
    minkowski(){
        cube(total);
        sphere(thickness);
    }
}

