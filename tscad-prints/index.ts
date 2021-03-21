import { dualMarch, processPolygons, writeOBJ } from "tscad";
import * as path from 'path'

const file = process.argv.slice(2)[0];
console.log(file);
const name = path.basename(file, '.ts');
import(file).then(({ main }: { main: Shape3 }) => {
  console.time('render');
  const faces = dualMarch({
    size: 2,
    minSize: 1,
    shape: main,
  });
  console.timeEnd('render');
  const mesh = processPolygons(faces);
  writeOBJ({ faces: mesh.faces, vertices: mesh.vertices, name });
});
