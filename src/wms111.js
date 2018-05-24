// Very basic WMS 1.1.1 implementation

const validRequests = ['getcapabilities', 'getmap'];

// Generate a GetCapabilities document based on the given configuration
function GetCapabilities(config) {
  return "OK";
}

const wms = function(config, query) {
  let response = new Promise((resolve, reject) => {

    // Check for invalid parameters
    if (query.service !== "WMS") {
      resolve({
        headers: { "Content-Type": "text/plain" },
        code: 400,
        data: "Bad Request - invalid service parameter"
      });
    } else if (query.request === undefined || !validRequests.includes(query.request.toLowerCase())) {
      resolve({
        headers: { "Content-Type": "text/plain" },
        code: 400,
        data: "Bad Request - invalid request parameter"
      });
    } else if (query.request.toLowerCase() === "getcapabilities") {
      resolve({
        headers: { "Content-Type": "text/plain" },
        code: 200,
        data: GetCapabilities(config)
      });
    } else if (query.request.toLowerCase() === "getmap") {
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
