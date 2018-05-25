const express     = require('express');
const fs          = require('fs');
const MapnikStyle = require('./src/mapnik_style');
const wms         = require('./src/wms111');

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
        let style = new MapnikStyle('styles/nedata.xml');
        return style.renderImage({
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
