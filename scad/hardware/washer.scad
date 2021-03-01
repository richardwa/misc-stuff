thickness=1;
$fn=100;

difference(){
  cylinder(r=10, h=thickness, center=true);
  cylinder(r=5, h=thickness+1, center=true);
};