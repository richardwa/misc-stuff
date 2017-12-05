
outer=4.6;
inner=3.8;
brim=6;

difference(){
    union(){
        cylinder(20,outer,outer,$fn=6);
        cylinder(2,brim,brim,$fn=100);
    }
    
    cylinder(100,inner,inner,$fn=6, center=true);
}