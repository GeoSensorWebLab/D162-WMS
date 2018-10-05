const builder = require('xmlbuilder');
const NAMESPACES = require('../namespaces');

/**
 * Class for WMS 1.1.1 Service Exception.
 *
 * @class      ServiceException (name)
 */
class ServiceException {
	/**
	 * Create a ServiceException object with a reason for the exception.
	 * 
	 * @param  {string} Reason for exception, will be passed to client
	 */
	constructor(reason) {
		this.reason = reason;
	}

	/**
	 * Generate an XML document for the exception.
	 *
	 * @return     {XML Document}  Service Exception XML Document.
	 */
	generate() {
		let xml = builder.create({
		  ServiceExceptionReport: {
		    "@version": "1.1.1",
		    ServiceException: {
		    	"#text": this.reason
		    }
		  }
		}, {
		  version: '1.0',
		  encoding: 'UTF-8',
		  standalone: false
		}, {
		  sysID: NAMESPACES.WMS_111_SE_SCHEMA
		});

		return xml.end({ pretty: true });
	}
}

module.exports = ServiceException;