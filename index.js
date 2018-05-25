const express = require('express');
const fs      = require('fs');
const wms     = require('./src/wms111');

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
      range: [0, 20],
      image: ['png'],
      getMap: () => {
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
