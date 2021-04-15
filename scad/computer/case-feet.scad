difference(){
     cyl(15,16);
     cyl(2,offset=-1);
     cyl(5,offset=3);
     cyl(13,offset=13);
}

module cyl(r, h=100,offset=0) {
    translate([0,0,offset]) 
    cylinder(h,r,r, $fn=100);
} 
