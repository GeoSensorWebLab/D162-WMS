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
    // Mapnik has these limits for image dimensions
    if (options.width > 65535) {
      options.width = 65535;
    }

    if (options.height > 65535) {
      options.height = 65535;
    }

    return new Promise((resolve, reject) => {
      try {
        this.map.resize(options.width, options.height);
      }
      catch (e) {
        reject(e);
      }

      this.map.load(this.stylesheetPath, (err, map) => {
        if (err) reject(err);

        map.zoomToBox(options.bbox);
        let image;
        try {
          image = new mapnik.Image(options.width, options.height);
        }
        catch (e) {
          reject(e);
        }

        if (image !== undefined) {
          map.render(image, (err, image) => {
            if (err) reject(err);
            image.encode(this.formatForMIME(options.format), (err, buffer) => {
                if (err) reject(err);
                resolve(buffer);
            });
          });
        }
      });
    });
  }

  // Convert a MIME type into a format for Mapnik's image encode
  formatForMIME(type) {
    switch(type) {
      case 'image/png':
      return 'png';
      break;
      case 'image/jpeg':
      return 'jpg';
      break;
      default:
      throw 'Unhandled MIME type ' + type;
    }
  }
}

module.exports = MapnikStyle;
