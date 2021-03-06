function ngon(num, r) = [for (i = [0:num - 1],
                              a = i * 360 / num)[r * cos(a), r *sin(a)]];

function matrix(x, y, dx,
                dy) = [for (i = [0:x - 1], j = [0:y - 1])[dx * i, dy *j]];

function tight_pack(x, y, d) = [for (
    i = [0:2 * x / 3 - 1],
    j = [0:2 * y - 1])[2 * d * sin(60) * (i + (j % 2) / 2), d *j *cos(60)]];

module hex_grid(box, d, t) {
  total = d + t;
  x = box[0] / total + 1;
  y = box[1] / total + 1;
  z = box[2];
  r = d / 2;
  adjusted =
      r *
      (2 -
       sqrt(3) / 2); // ratio of side distance to corner distance of a hexagon
  for (p = tight_pack(x, y, total))
    translate(p - [ x * total / 2, y * total / 2, 0 ])
        cylinder(z, adjusted, adjusted, $fn = 6);
}

module trapazoid_prism(bottom_width, bottom_length, top_width, top_length,
                       height, center = false) {
  CubeFaces = [
    [ 0, 1, 2, 3 ], // bottom
    [ 4, 5, 1, 0 ], // front
    [ 7, 6, 5, 4 ], // top
    [ 5, 6, 2, 1 ], // right
    [ 6, 7, 3, 2 ], // back
    [ 7, 4, 0, 3 ]
  ]; // left

  if (center) {
    CubePoints = [
      [ -bottom_width / 2, -bottom_length / 2, -height / 2 ],
      [ -bottom_width / 2, bottom_length / 2, -height / 2 ],
      [ bottom_width / 2, bottom_length / 2, -height / 2 ],
      [ bottom_width / 2, -bottom_length / 2, -height / 2 ],

      [ -top_width / 2, -top_length / 2, height / 2 ],
      [ -top_width / 2, top_length / 2, height / 2 ],
      [ top_width / 2, top_length / 2, height / 2 ],
      [ top_width / 2, -top_length / 2, height / 2 ]
    ];
    polyhedron(CubePoints, CubeFaces);
  } else {
    CubePoints = [
      [ 0, 0, 0 ],                        // 0
      [ bottom_width, 0, 0 ],             // 1
      [ bottom_width, bottom_length, 0 ], // 2
      [ 0, bottom_length, 0 ],            // 3

      [ 0, 0, height ],                  // 0
      [ top_width, 0, height ],          // 1
      [ top_width, top_length, height ], // 2
      [ 0, top_length, height ]
    ];
    polyhedron(CubePoints, CubeFaces);
  }
}

//fillet functions from
//https://github.com/clothbot/ClothBotCreations/blob/master/utilities/fillet.scad
module fillet(r=1.0,steps=3,include=true) {
  if(include) for (k=[0:$children-1]) {
	children(k);
  }
  for (i=[0:$children-2] ) {
    for(j=[i+1:$children-1] ) {
	fillet_two(r=r,steps=steps) {
	  children(i);
	  children(j);
	  intersection() {
		children(i);
		children(j);
	  }
	}
    }
  }
}

module fillet_two(r=1.0,steps=3) {
  for(step=[1:steps]) {
	hull() {
	  render() intersection() {
		children(0);
		offset_3d(r=r*step/steps) children(2);
	  }
	  render() intersection() {
		children(1);
		offset_3d(r=r*(steps-step+1)/steps) children(2);
	  }
	}
  }
}

module offset_3d(r=1.0) {
  for(k=[0:$children-1]) minkowski() {
	children(k);
	sphere(r=r,$fn=8);
  }
}
