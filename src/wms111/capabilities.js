const builder = require('xmlbuilder');
const NAMESPACES = require('../namespaces');

/**
 * Class for WMS 1.1.1 capabilities.
 */
class Capabilities {
	/**
	 * Creates a Capabilities object with various configuration 
	 * parameters.
	 *
	 * @param      {Object}  config  The configuration
	 */
	constructor(config) {
		this.config = config;
	}

	/**
	 * Generate an XML document for the capabilities
	 */
	generate() {
		let xml = builder.create({
		  WMT_MS_Capabilities: {
		    "@version": "1.1.1",
		    Service: {
		      Name: {
		        "#text": "OGC:WMS"
		      },
		      Title: {
		        "#text": this.config.title
		      },
		      Abstract: {
		        "#text": this.config.abstract
		      },
		      OnlineResource: {
		        "@xmlns:xlink": NAMESPACES.XLINK,
		        "@xlink:type": "simple",
		        "@xlink:href": this.config.host
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
		                  "@xmlns:xlink": NAMESPACES.XLINK,
		                  "@xlink:type": "simple",
		                  "@xlink:href": this.config.host + '/service?'
		                }
		              }
		            }
		          }
		        },

		        GetMap: this.GetCapabilitiesGetMapObject()
		      },

		      Exception: {
		        // To create multiple elements of the same name, use an array
		        // and xmlbuilder will handle it.
		        Format: [
		          { "#text": "application/vnd.ogc.se_xml" }
		          // { "#text": "application/vnd.ogc.se_inimage" },
		          // { "#text": "application/vnd.ogc.se_blank" }
		        ]
		      },

		      // Layers
		      Layer: this.GetCapabilitiesLayersObject()
		    }
		  }
		}, {
		  version: '1.0',
		  encoding: 'UTF-8',
		  standalone: false
		}, {
		  sysID: NAMESPACES.WMS_111_SCHEMA
		});

		return xml.end({ pretty: true });
	}

	/**
	 * Generate a subsection for the GetMap requests.
	 *
	 * @return     {XML Document}  The GetMap section.
	 */
	GetCapabilitiesGetMapObject() {
	  let node = {
	    Format: []
	  };

	  // Add supported formats
	  let formats = [];
	  this.config.layers.forEach((layer) => {
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
	          "@xmlns:xlink": NAMESPACES.XLINK,
	          "@xlink:type": "simple",
	          "@xlink:href": this.config.host + '/service?'
	        }
	      }
	    }
	  };

	  return node;
	}

	/**
	 * Generate the Layer(s) subsection for all layers defined in 
	 * Capabilities configuration.
	 *
	 * @return     {XML Document}  The Layers section.
	 */
	GetCapabilitiesLayersObject() {
	  let node = this.config.layers.map((layer) => {
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
}

module.exports = Capabilities;