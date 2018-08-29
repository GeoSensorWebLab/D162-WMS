// Test script that will use Mapnik to render a stylesheet.
const fs     = require('fs');
const mapnik = require('mapnik');

// register fonts and datasource plugins
mapnik.register_default_fonts();
mapnik.register_system_fonts();
mapnik.register_default_input_plugins();

var map = new mapnik.Map(256, 256);
map.load('../styles/nedata.xml', (err,map) => {
    if (err) throw err;
    map.zoomAll();
    var im = new mapnik.Image(256, 256);
    map.render(im, (err,im) => {
      if (err) throw err;
      im.encode('png', (err,buffer) => {
          if (err) throw err;
          fs.writeFile('test-mapnik.png',buffer, (err) => {
              if (err) throw err;
              console.log('saved map image to test-mapnik.png');
          });
      });
    });
});
