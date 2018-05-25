const express = require('express');
const fs      = require('fs');
const mapnik  = require('mapnik');
const proj4   = require('proj4');
const wms     = require('./src/wms111');

// register fonts and datasource plugins
mapnik.register_default_fonts();
mapnik.register_default_input_plugins();

let app = express();

let fakeTile = fs.readFileSync('grad.png');
let fakeHeaders = {
  'content-type': 'image/png'
};

// Read a Mapnik XML stylesheet from a path, and use options to generate an
// image. Options:
// * bbox   - array of four floats delineating region to render
// * format - MIME type of output
// * height - pixel height of output image
// * srs    - PROJ4 style projection definition of output map (geographic, not screen)
// * width  - pixel width of output image
//
// Returns a Promise that resolves with a buffer containing the image, or
// rejects with an error.
function mapnikRender(stylesheetPath, options) {
  let map = new mapnik.Map(options.width, options.height);

  return new Promise((resolve, reject) => {
    map.load(stylesheetPath, (err, map) => {
      if (err) reject(err);

      map.zoomToBox(options.bbox);
      let image = new mapnik.Image(options.width, options.height);

      map.render(image, (err, image) => {
        if (err) reject(err);
        image.encode('png', (err, buffer) => {
            if (err) reject(err);
            resolve(buffer);
        });
      });
    });
  });
}

let service = {
  title: 'D162 WMS',
  abstract: 'WMS implementation for D162',
  host: 'http://localhost:3000',
  layers: [
    {
      title: 'Sample',
      name: 'sample',
      bbox: [-180, -85,
              180, 85],
      extent: [-20026376.39, -20048966.10, 20026376.39, 20048966.10],
      srs: 'EPSG:3857',
      range: [0, 20],
      image: ['png'],
      // Return a buffer
      getMap: (params) => {
        return mapnikRender('styles/nedata.xml', {
          width: parseInt(params.WIDTH),
          height: parseInt(params.HEIGHT),
          bbox: params.BBOX.split(',').map(parseFloat),
          srs: params.SRS
        });
      }
    }
  ]
};

app.get('/service', (req, res) => {
  wms(service, req.query).then((wmsResponse) => {
    res.set(wmsResponse.headers);
    res.status(wmsResponse.code);
    res.send(wmsResponse.data);
  });
});

app.listen(3000, () => {
  console.log("Running on port 3000");
});
