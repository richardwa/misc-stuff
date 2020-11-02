type Shape = {
  // we generally don't manipulate the shape directly, but it is here as a reference type
  polygons: []
}

declare module '@jscad/csg' {
  const CSG: {
    cube: ([x, y, z]) => Shape;
    roundedCylinder: () => Shape;
  }
}

declare module '@jscad/openjscad' {
  type OutputTypes = 'stlb';
  const generateOutput: (a: OutputTypes, b) => Output;
  class Output {
    asBuffer: () => NodeJS.ArrayBufferView;
  }
}