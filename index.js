const express     = require('express');
const MapnikStyle = require('./src/mapnik_style');
const wms         = require('./src/wms111');

let app = express();

// Use Environment Variables to modify these for production use
let host = process.env.HOST || "localhost";
let port = process.env.PORT || 3000;

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

app.get(/\/service\??/, (req, res) => {
  wms(service, req.query).then((wmsResponse) => {
    res.set(wmsResponse.headers);
    res.status(wmsResponse.code);
    res.send(wmsResponse.data);
  });
});

app.listen(port, () => {
  console.log(`Running on port ${port}`);
});
