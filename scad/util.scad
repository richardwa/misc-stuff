
function ngon(num,r) = 
    [for (i=[0:num-1], a=i*360/num) [ r*cos(a), r*sin(a) ]];

function matrix(x,y,dx,dy) =
    [for(i=[0:x-1],j=[0:y-1]) [dx*i,dy*j]];
    
function tight_pack(x, y, d) =
    [for(i=[0:2*x/3-1],j=[0:2*y-1]) [2*d*sin(60)* (i + (j%2)/2), d*j*cos(60)]];


module hex_grid(box, d, t) {
    total = d + t;
    x = box[0]/total+1;
    y = box[1]/total+1;
    z = box[2];
    r = d/2;
    adjusted = r * (2 - sqrt(3)/2); //ratio of side distance to corner distance of a hexagon
    for (p=tight_pack(x, y, total))
        translate(p - [x * total / 2 , y * total / 2, 0]) 
        cylinder(z, adjusted, adjusted, $fn=6);
}
