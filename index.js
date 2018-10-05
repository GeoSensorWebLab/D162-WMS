const Compiler    = require('./src/carto_compiler');
const express     = require('express');
const fs          = require('fs');
const MapnikStyle = require('./src/mapnik_style');
const path        = require('path');
const WMS         = require('./src/wms111');

let app = express();

// Use Environment Variables to modify these for production use
let host = process.env.HOST || "localhost";
let port = process.env.PORT || 3000;
let autoUpdate;

if (process.env.WATCH === undefined) {
  autoUpdate = true;
} else {
  autoUpdate = process.env.WATCH === "TRUE";
}

let service = {
  title:    'D162 WMS',
  abstract: 'WMS implementation for D162',
  host:     `http://${host}:${port}`,
  layers: [
    {
      // human-readable title
      title: 'Sample',
      // machine-readable name
      name: 'sample',
      // EPSG:4326 bounding box for layer
      bbox: [-180, -85, 180, 85],
      // An extent object is required for each projection supported.
      // The bbox should be in the coordinates of the SRS.
      bounds: [{
        srs:  'EPSG:3857',
        bbox: [-20026376.39, -20048966.10, 20026376.39, 20048966.10]
      }],
      // Rendering output formats supported
      formats: ['image/png'],
      // Return a Promise that resolves with a Buffer containing the image
      getMap: (params) => {
        let style = new MapnikStyle('styles/nedata.xml');
        return style.renderImage({
          format: params.FORMAT,
          width:  parseInt(params.WIDTH),
          height: parseInt(params.HEIGHT),
          bbox:   params.BBOX.split(',').map(parseFloat),
          srs:    params.SRS
        });
      }
    },
    {
      // human-readable title
      title: 'Testbed 14 Daraa',
      // machine-readable name
      name: 'testbed',
      // EPSG:4326 bounding box for layer
      bbox: [-180, -85, 180, 85],
      // An extent object is required for each projection supported.
      // The bbox should be in the coordinates of the SRS.
      bounds: [{
        srs:  'EPSG:3857',
        bbox: [-20026376.39, -20048966.10, 20026376.39, 20048966.10]
      }],
      // Rendering output formats supported
      formats: ['image/png'],
      // Return a Promise that resolves with a Buffer containing the image
      getMap: (params) => {
        let style = new MapnikStyle('styles/testbed.xml');
        return style.renderImage({
          format: params.FORMAT,
          width:  parseInt(params.WIDTH),
          height: parseInt(params.HEIGHT),
          bbox:   params.BBOX.split(',').map(parseFloat),
          srs:    params.SRS
        });
      }
    }
  ]
};

let wms = new WMS(service);

// Start HTTP Server
app.get(/\/service\??/, (req, res) => {
  wms.respondTo(req).then((wmsResponse) => {
    res.set(wmsResponse.headers);
    res.status(wmsResponse.code);
    res.send(wmsResponse.data);
  });
});

app.listen(port, () => {
  console.log(`Running on port ${port}`);
});

// Start FS watcher for stylesheet changes
if (autoUpdate) {
  let stylesDir = path.join(__dirname, 'styles');
  fs.watch(stylesDir, (eventType, filename) => {

    if (path.extname(filename) !== ".xml") {
      console.log("Stylesheet directory changed, updating stylesheets for Mapnik");

      // On any change, re-compile all stylesheets
      fs.readdir(stylesDir, (err, files) => {
        if (err) {
          throw err;
        }

        let mmlFiles = files.filter((file) => {
          return path.extname(file) === ".mml";
        });

        let compiler = new Compiler();

        mmlFiles.forEach((mmlFile) => {
          let mmlPath = path.join(stylesDir, mmlFile);
          let basename = path.basename(mmlPath, ".mml");
          let outputPath = path.join(stylesDir, `${basename}.xml`);


          compiler.compile(mmlPath, outputPath);
        });
      });
    }
  });
}