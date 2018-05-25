// Very basic WMS 1.1.1 implementation
const builder = require('xmlbuilder');
const mapnik  = require('mapnik');

const validRequests = ['getcapabilities', 'getmap'];

// Generate a GetCapabilities document based on the given configuration
function GetCapabilities(config) {
  let xml = builder.create('WMT_MS_Capabilities', {
    version: '1.0',
    encoding: 'UTF-8',
    standalone: false
  }, {
    sysID: 'http://schemas.opengis.net/wms/1.1.1/capabilities_1_1_1.dtd'
  })
  .att({ version: '1.1.1' })
  .ele('Service')
    .ele('Name', config.title.toLowerCase().replace(/ /, '-')).up()
    .ele('Title', config.title).up()
    .ele('Abstract', config.abstract).up()
    .ele('OnlineResource', {
      "xmlns:xlink": "http://www.w3.org/1999/xlink",
      "xlink:type": "simple",
      "xlink:href": config.host
    }).up()
    .up()
  .ele('Capability')
    .ele('Request')
      .ele('GetCapabilities')
        .ele('Format', 'application/vnd.ogc.wms_xml').up()
        .ele('DCPType')
          .ele('HTTP')
            .ele('Get')
              .ele('OnlineResource', {
                "xmlns:xlink": "http://www.w3.org/1999/xlink",
                "xlink:type": "simple",
                "xlink:href": config.host + '/service'
              }).up()
              .up()
            .up()
          .up()
        .up()
      .ele('GetMap')
        .ele('Format', 'image/png').up()
        .ele('DCPType')
          .ele('HTTP')
            .ele('Get')
              .ele('OnlineResource', {
                "xmlns:xlink": "http://www.w3.org/1999/xlink",
                "xlink:type": "simple",
                "xlink:href": config.host + '/service'
              }).up()
              .up()
            .up()
          .up()
        .up()
      .up()
    .ele('Exception')
      .ele('Format', 'application/vnd.ogc.se_xml').up()
      .ele('Format', 'application/vnd.ogc.se_inimage').up()
      .ele('Format', 'application/vnd.ogc.se_blank').up()
      .up()
    .importDocument(GetCapabilitiesLayers(config))
  .end({ pretty: true });

  return xml;
}

// Generate the Layer(s) subsection for all layers defined in `config`
function GetCapabilitiesLayers(config) {
  let xml = builder.begin();

  config.layers.forEach((layer) => {
    let baseLayer = xml.ele('Layer')
      .ele('Name', layer.name).up()
      .ele('Title', layer.title).up()
      .ele('SRS', 'EPSG:3857').up()
      .ele('LatLonBoundingBox', {
        "minx": layer.bbox[0],
        "miny": layer.bbox[1],
        "maxx": layer.bbox[2],
        "maxy": layer.bbox[3]
      }).up();

    layer.bounds.forEach((extent) => {
      baseLayer.ele('BoundingBox', {
        "srs": extent.srs,
        "minx": extent.bbox[0],
        "miny": extent.bbox[1],
        "maxx": extent.bbox[2],
        "maxy": extent.bbox[3]
      });
    });

      // Sub-layers
      baseLayer.ele('Layer')
        .ele('Name', layer.name).up()
        .ele('Title', layer.title).up();
  });

  return xml.root();
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

const wms = function(config, query) {
  let response = new Promise((resolve, reject) => {

    // Check for invalid parameters
    if (query.SERVICE !== "WMS") {
      resolve({
        headers: { "Content-Type": "text/plain" },
        code: 400,
        data: "Bad Request - invalid service parameter"
      });
    } else if (query.REQUEST === undefined || !validRequests.includes(query.REQUEST.toLowerCase())) {
      resolve({
        headers: { "Content-Type": "text/plain" },
        code: 400,
        data: "Bad Request - invalid request parameter"
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
