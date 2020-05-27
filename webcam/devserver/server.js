const Bundler = require('parcel-bundler');
const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');


const app = express();

app.use(createProxyMiddleware(
  ['/streams', '/camera1', '/camera2', '/camera3'],
  { target: 'http://localhost' })
);

const bundler = new Bundler('src/index.html', {
  outDir: "target"
});

app.use(bundler.middleware());

app.listen(8000);