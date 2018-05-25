const fs = require('fs');
const mapnik = require('mapnik');

mapnik.register_default_fonts();
mapnik.register_default_input_plugins();

class MapnikStyle {
  constructor(stylesheetPath) {
    this.stylesheetPath = stylesheetPath;
    this.map = new mapnik.Map(256, 256);
  }

  // Generate an image using the stylesheet. Options:
  // * bbox   - array of four floats delineating region to render
  // * format - MIME type of output
  // * height - pixel height of output image
  // * srs    - PROJ4 style projection definition of output map (geographic, not screen)
  // * width  - pixel width of output image
  //
  // Returns a Promise that resolves with a buffer containing the image, or
  // rejects with an error.
  renderImage(options) {
    this.map.resize(options.width, options.height);

    return new Promise((resolve, reject) => {
      this.map.load(this.stylesheetPath, (err, map) => {
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
}

module.exports = MapnikStyle;
