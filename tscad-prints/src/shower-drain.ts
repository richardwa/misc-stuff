import { union } from 'tscad';
import { rotate, translate } from 'tscad';
import { box, sphere } from 'tscad';

export const main = rotate('y', 0, rotate('z', 0,
  union({ radius: 3 },
    box(20.2),
    translate([10, 10, 10], sphere(10)))));
