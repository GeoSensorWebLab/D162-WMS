// Very basic WMS 1.1.1 implementation
const builder = require('xmlbuilder');
const mapnik  = require('mapnik');

const validRequests = ['capabilities', 'getcapabilities', 'getmap'];

// Generate a GetCapabilities document based on the given configuration
function GetCapabilities(config) {
  let xml = builder.create({
    WMT_MS_Capabilities: {
      "@version": "1.1.1",
      Service: {
        Name: {
          "#text": "OGC:WMS"
        },
        Title: {
          "#text": config.title
        },
        Abstract: {
          "#text": config.abstract
        },
        OnlineResource: {
          "@xmlns:xlink": "http://www.w3.org/1999/xlink",
          "@xlink:type": "simple",
          "@xlink:href": config.host
        }
      },

      Capability: {
        Request: {
          GetCapabilities: {
            Format: {
              "#text": "application/vnd.ogc.wms_xml"
            },
            DCPType: {
              HTTP: {
                Get: {
                  OnlineResource: {
                    "@xmlns:xlink": "http://www.w3.org/1999/xlink",
                    "@xlink:type": "simple",
                    "@xlink:href": config.host + '/service?'
                  }
                }
              }
            }
          },

          GetMap: GetCapabilitiesGetMapObject(config)
        },

        Exception: {
          // To create multiple elements of the same name, use an array
          // and xmlbuilder will handle it.
          Format: [
            { "#text": "application/vnd.ogc.se_xml" },
            { "#text": "application/vnd.ogc.se_inimage" },
            { "#text": "application/vnd.ogc.se_blank" }
          ]
        },

        // Layers
        Layer: GetCapabilitiesLayersObject(config)
      }
    }
  }, {
    version: '1.0',
    encoding: 'UTF-8',
    standalone: false
  }, {
    sysID: 'http://schemas.opengis.net/wms/1.1.1/capabilities_1_1_1.dtd'
  });

  return xml.end({ pretty: true });
}

// Generate a subsection for the GetMap requests
function GetCapabilitiesGetMapObject(config) {
  let node = {
    Format: []
  };

  // Add supported formats
  let formats = [];
  config.layers.forEach((layer) => {
    layer.formats.forEach((format) => {
      if (!formats.includes(format)) {
        formats.push(format);
      }
    });
  });

  node.Format = formats;

  node.DCPType = {
    HTTP: {
      Get: {
        OnlineResource: {
          "@xmlns:xlink": "http://www.w3.org/1999/xlink",
          "@xlink:type": "simple",
          "@xlink:href": config.host + '/service?'
        }
      }
    }
  };

  return node;
}

// Generate the Layer(s) subsection for all layers defined in `config`
function GetCapabilitiesLayersObject(config) {
  let node = config.layers.map((layer) => {
    let layerElement = {
      Name: { "#text": layer.name },
      Title: { "#text": layer.title },
      SRS: { "#text": "EPSG:3857" },
      LatLonBoundingBox: {
        "@minx": layer.bbox[0],
        "@miny": layer.bbox[1],
        "@maxx": layer.bbox[2],
        "@maxy": layer.bbox[3]
      },

      BoundingBox: layer.bounds.map((extent) => {
        return {
          "@SRS": extent.srs,
          "@minx": extent.bbox[0],
          "@miny": extent.bbox[1],
          "@maxx": extent.bbox[2],
          "@maxy": extent.bbox[3]
        };
      }),

      Layer: {
        Name: { "#text": layer.name },
        Title: { "#text": layer.title }
      }
    };

    return layerElement;
  });

  return node;
}

function validateGetMap(config, query) {
  return new Promise((resolve, reject) => {
    let errors = [];

    if (query.VERSION === undefined || query.VERSION !== '1.1.1') {
      errors.push('invalid VERSION');
    }

    if (query.LAYERS === undefined) {
      errors.push('missing LAYERS');
    }

    let validLayers = config.layers.map((l) => { return l.name; });

    query.LAYERS.split(',').forEach((queryLayer) => {
      if (!validLayers.includes(queryLayer)) {
        errors.push(`invalid LAYERS "${queryLayer}"`);
      }
    });

    if (query.STYLES === undefined) {
      errors.push('missing STYLES');
    }

    if (query.SRS === undefined) {
      errors.push('missing SRS');
    }

    if (query.BBOX === undefined) {
      errors.push('missing BBOX');
    }

    if (query.WIDTH === undefined) {
      errors.push('missing WIDTH');
    }

    if (query.HEIGHT === undefined) {
      errors.push('missing HEIGHT');
    }

    if (query.FORMAT === undefined) {
      errors.push('missing FORMAT');
    }

    if (errors.length === 0) {
      resolve(query);
    } else {
      reject(errors);
    }
  });
}

// Convert all query parameter keys to UPPERCASE
function cleanParams(params) {
  let newParams = {};
  Object.entries(params).forEach((pair) => {
    newParams[pair[0].toUpperCase()] = pair[1];
  });

  return newParams;
}

const wms = function(config, query) {
  query = cleanParams(query);

  let response = new Promise((resolve, reject) => {

    // Check for invalid parameters
    if (query.REQUEST === undefined || !validRequests.includes(query.REQUEST.toLowerCase())) {
      resolve({
        headers: { "Content-Type": "text/plain" },
        code: 400,
        data: "Bad Request - invalid request parameter"
      });
      } else if (query.REQUEST.toLowerCase() === "capabilities") {
      console.log("capabilities");
      resolve({
        headers: { "Content-Type": "application/vnd.ogc.wms_xml" },
        code: 200,
        data: GetCapabilities(config)
      });
    } else if (query.REQUEST.toLowerCase() === "getcapabilities") {
      console.log("GetCapabilities");
      resolve({
        headers: { "Content-Type": "application/vnd.ogc.wms_xml" },
        code: 200,
        data: GetCapabilities(config)
      });
    } else if (query.REQUEST.toLowerCase() === "getmap") {
      console.log("GetMap", query);

      validateGetMap(config, query).then((query) => {
        console.log("Good GetMap");

        // Composite images for each layer
        let buffers = query.LAYERS.split(',').map((queryLayer) => {
          let layer = config.layers.find((l) => { return l.name === queryLayer; });
          return layer.getMap(query);
        });

        Promise.all(buffers).then((buffers) => {
          mapnik.blend(buffers, (err, result) => {
            if (err) {
              resolve({
                headers: { "Content-Type": "text/plain" },
                code: 500,
                data: `Error ${err}`
              });
            } else {
              resolve({
                headers: { "Content-Type": query.FORMAT },
                code: 200,
                data: result
              })
            }
          });
        }, (error) => {
          resolve({
            headers: { "Content-Type": "text/plain" },
            code: 500,
            data: `Error ${error}`
          });
        });

      }, (errors) => {
        console.log("Bad GetMap", errors);
        resolve({
          headers: { "Content-Type": "text/plain" },
          code: 400,
          data: "Bad Request\n" + errors.join("\n")
        });
      });
    }
  });

  return response;
}

module.exports = wms;
