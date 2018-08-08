// Check for the necessary source data for Testbed 14
// If it exists in the data directory, decompress it and process it so the
// OSM attributes are available for CartoCSS stylesheets.

// Cases:
// * extracted dataset doesn't exist, archive doesn't exist
// * extracted dataset doesn't exist, archive exists
// * extracted dataset exists, it has not been processed
// * extracted dataset exists, it has been processed
