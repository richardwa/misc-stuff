use<util.scad>;

$fn = 60;

bot_width = 22;
bot_length = 12;
top_width = 19;
top_length = 10;
height = 26;
t = 2;

cyl_length = 40;
cyl_radius = 5;
cyl_offset = 0.5 * (top_length + bot_length) / 2;

inf = 100;

module trap() {
  trapazoid_prism(bot_width, bot_length, top_width, top_length, height,
                  center = true);
}

intersection() {

  difference() {
    fillet(r=1,steps=5) {
      minkowski() {
        trap();
        sphere(r = t);
      }

      // rod
      translate([ 0, -cyl_length / 2 - cyl_offset, height / 2 - cyl_radius ])
          rotate([ 90, 0, 0 ]) union() {
        cylinder(cyl_length, r = cyl_radius, center = true);
        cylinder(cyl_length, r = cyl_radius, center = true);
      }
    }

    // minus body
    minkowski() {
      trap();
      sphere(r = t / 10);
    }

    // minus gap
    translate([ 0, 2 * t, 0 ])
        trapazoid_prism(bot_width - 4, bot_length, top_width - 4, top_length,
                        height, center = true);
  }

  // cut top and bottom
  cube(size = [ inf, inf, height - 0.001 ], center = true);
}
