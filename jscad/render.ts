import * as jscad from '@jscad/openjscad';
import * as fs from 'fs';

const file = process.argv[2];
import(file).then(({default:shape}) => {
  console.log(JSON.stringify(shape));
  var outputData = jscad.generateOutput('stlb', shape);
  fs.writeFileSync('target/torus.stl', outputData.asBuffer())
})
