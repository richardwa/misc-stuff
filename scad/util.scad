
function ngon(num,r) = [for (i=[0:num-1], a=i*360/num) [ r*cos(a), r*sin(a) ]];

module round(r) {
    minkowski(){
        children()
        sphere(r)
    }
}