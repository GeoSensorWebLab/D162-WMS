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
        let width = parseInt(params.WIDTH);
        let height = parseInt(params.HEIGHT);
        let map = new mapnik.Map(width, height);

        let bboxSRS = params.SRS;
        let bbox = params.BBOX.split(',').map((item) => {
          return parseFloat(item);
        });

        return new Promise((resolve, reject) => {
          map.load('styles/nedata.xml', (err,map) => {
            if (err) reject(err);

            // Transform request bounding box to map SRS
            // Something goes wrong here and the results get wrapped incorrectly
            let new_sw = proj4(bboxSRS, map.srs, [bbox[0], bbox[1]]);
            let new_ne = proj4(bboxSRS, map.srs, [bbox[2], bbox[3]]);
            let newbbox = [new_sw[0], new_sw[1], new_ne[0], new_ne[1]];

            map.zoomToBox(newbbox);

            var im = new mapnik.Image(width, height);
            map.render(im, (err,im) => {
              if (err) reject(err);
              im.encode('png', (err,buffer) => {
                  if (err) reject(err);
                  resolve(buffer);
              });
            });
          });
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
