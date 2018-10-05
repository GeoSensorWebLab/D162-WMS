// Very basic WMS 1.1.1 implementation
const builder = require('xmlbuilder');
const Capabilities = require('./wms111/capabilities');
const mapnik  = require('mapnik');
const NAMESPACES = require('./namespaces');

const validRequests = ['capabilities', 'getcapabilities', 'getmap'];

// Generate a GetCapabilities document based on the given configuration
function GetCapabilities(config) {
  let capabilities = new Capabilities(config);
  return capabilities.generate();
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
