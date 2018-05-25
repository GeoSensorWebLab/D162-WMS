// Very basic WMS 1.1.1 implementation
const builder = require('xmlbuilder');

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
    xml.ele('Layer')
      .ele('Name', layer.name).up()
      .ele('Title', layer.title).up()
      .ele('SRS', 'EPSG:3857').up()
      .ele('LatLonBoundingBox', {
        "minx": layer.bbox[0],
        "miny": layer.bbox[1],
        "maxx": layer.bbox[2],
        "maxy": layer.bbox[3]
      }).up()
      .ele('Layer')
        .ele('Name', layer.name).up()
        .ele('Title', layer.title).up();
  });

  return xml.root();
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
      console.log("GetMap");
      resolve({
        headers: { "Content-Type": "text/plain" },
        code: 200,
        data: "OK"
      });
    }
  });

  return response;
}

module.exports = wms;
