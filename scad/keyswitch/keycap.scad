inf = 100;

difference(){
  union(){
    difference(){
      cube([18,18,4],center=true);
      translate ([0,0,inf/2 + 1]) cube([16,16,inf],center=true);
    }
    translate ([2.8,0,0]) cube([1.2,2.8,7],center=true);
    translate ([-2.8,0,0]) cube([1.2,2.8,7],center=true);
  }
  translate([0,0,-1*inf/2]) cube([inf,inf,inf],center=true);
}
