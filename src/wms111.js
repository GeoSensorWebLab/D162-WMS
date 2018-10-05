const Capabilities = require('./wms111/capabilities');
const mapnik  = require('mapnik');
const ServiceException = require('./wms111/service_exception');

const validRequests = ['capabilities', 'getcapabilities', 'getmap'];

/**
 * Class for WMS 1.1.1 server.
 */
class WMS {
  /**
   * Initialize a WMS 1.1.1 object that can handle requests and send
   * back responses.
   *
   * @param      {Object}  config  The configuration
   */
  constructor(config) {
    this.config = config;
    this.capabilities = new Capabilities(this.config);
  }

  /**
   * For the given request, determine what type of response to 
   * send.
   *
   * @param      {string}  request   The Request from the client.
   * @return     {Promise} Promise object with response data.
   */
  respondTo(request) {
    let query = this.cleanParams(request.query);

    let response = new Promise((resolve, reject) => {

      // Check for invalid parameters
      if (query.REQUEST === undefined || !validRequests.includes(query.REQUEST.toLowerCase())) {
        resolve({
          headers: { "Content-Type": "application/vnd.ogc.se_xml" },
          code: 400,
          data: this.buildException("Bad Request - invalid request parameter")
        });
        } else if (query.REQUEST.toLowerCase() === "capabilities") {
        resolve({
          headers: { "Content-Type": "application/vnd.ogc.wms_xml" },
          code: 200,
          data: this.buildCapabilities()
        });
      } else if (query.REQUEST.toLowerCase() === "getcapabilities") {
        resolve({
          headers: { "Content-Type": "application/vnd.ogc.wms_xml" },
          code: 200,
          data: this.buildCapabilities()
        });
      } else if (query.REQUEST.toLowerCase() === "getmap") {

        this.validateGetMap(query).then((query) => {
          // Composite images for each layer
          let buffers = query.LAYERS.split(',').map((queryLayer) => {
            let layer = this.config.layers.find((l) => { return l.name === queryLayer; });
            return layer.getMap(query);
          });

          Promise.all(buffers).then((buffers) => {
            mapnik.blend(buffers, (err, result) => {
              if (err) {
                resolve({
                  headers: { "Content-Type": "application/vnd.ogc.se_xml" },
                  code: 500,
                  data: this.buildException(`Error ${err}`)
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
              headers: { "Content-Type": "application/vnd.ogc.se_xml" },
              code: 500,
              data: this.buildException(`Error ${error}`)
            });
          });

        }, (errors) => {
          console.log("Bad GetMap", errors);
          resolve({
            headers: { "Content-Type": "application/vnd.ogc.se_xml" },
            code: 400,
            data: this.buildException("Bad Request\n" + errors.join("\n"))
          });
        });
      }
    });

    return response;
  }

  /**
   * Create a capabilities document, using the configuration of this
   * WMS as details.
   *
   * @return     {XML Document}  The capabilities XML document.
   */
  buildCapabilities() {
    return this.capabilities.generate();
  }

  /**
   * Generates a ServiceException document for a given reason.
   *
   * @param      {string}  reason  The reason for the exception.
   * @return     {XML Document}  The Service Exception XML Document.
   */
  buildException(reason) {
    let exception = new ServiceException(reason);
    return exception.generate();
  }

  /**
   * Convert keys in parameters object to all uppercase, to simplify
   * comparisons.
   *
   * @param      {Object}  query  The query parameters
   * @return     {Object}  The updated query parameters
   */
  cleanParams(query) {
    let newParams = {};
    Object.entries(query).forEach((pair) => {
      newParams[pair[0].toUpperCase()] = pair[1];
    });

    return newParams;
  }

  /**
   * Validate that the query parameters are valid for a GetMap request.
   * Returns a Promise.
   *
   * @param      {Object}  query   The query parameters.
   * @return     {Promise} Promise that resolves if valid, rejects if
   *                       invalid.
   */
  validateGetMap(query) {
    return new Promise((resolve, reject) => {
      let errors = [];

      if (query.VERSION === undefined || query.VERSION !== '1.1.1') {
        errors.push('invalid VERSION');
      }

      if (query.LAYERS === undefined || query.LAYERS === "") {
        errors.push('missing LAYERS');
      } else {
        let validLayers = this.config.layers.map((l) => { return l.name; });

        query.LAYERS.split(',').forEach((queryLayer) => {
          if (!validLayers.includes(queryLayer)) {
            errors.push(`invalid LAYERS "${queryLayer}"`);
          }
        });
      }

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
}

module.exports = WMS;
