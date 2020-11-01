import * as jscad from '@jscad/openjscad';
import * as fs from 'fs';

const file = process.argv[2];
import(file).then(({default:shape}) => {
  var outputData = jscad.generateOutput('stlb', shape);
  fs.writeFileSync('torus.stl', outputData.asBuffer())
})
