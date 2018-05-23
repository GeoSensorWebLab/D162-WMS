var express = require('express');
var fs      = require('fs');
var wms     = require('wms');

var app = express();

var fakeTile = fs.readFileSync('grad.png');
var fakeHeaders = {
  'content-type': 'image/png'
};

var service = {
  title: 'D162 WMS',
  abstract: 'WMS implementation for D162',
  host: 'http://localhost:3000',
  layers: [
    {
      title: 'Sample',
      name: 'sample',
      bbox: [-106.787109375, 25.8394494020632,
          -93.427734375, 36.6331620955865],
      range: [0, 20],
      image: ['png'],
      getTile: (zoom, x, y, callback) => {
        process.nextTick(callback, null, fakeTile, fakeHeaders);
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
