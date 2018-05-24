// Download the shapefiles for the stylesheet
const path   = require('path');
const fs     = require('fs');
const http   = require('http');
const https  = require('https');
const moment = require('moment');
const URL    = require('url');

const data = require('./data.json');

function schemeForURI(uri) {
  return uri.startsWith('https') ? https : http;
}

function download(uri, filepath) {
  let url          = URL.parse(uri);
  let scheme       = schemeForURI(uri);
  let options = {
    method:   'GET',
    hostname: url.hostname,
    path:     url.pathname
  };

  if (fs.existsSync(filepath)) {
    console.log("File already exists, checking modification time");
    let stats = fs.statSync(filepath);
    options.headers = options.headers || {};
    options.headers['if-modified-since'] = moment(stats.mtime).utc().format("ddd, DD MMM YYYY HH:mm:ss") + " GMT";
  }

  let request = scheme.request(options, (response) => {
    // Handle redirects
    if (response.statusCode >= 301 && response.statusCode < 304 && response.headers['location'] !== undefined) {
      console.log("Following redirect");
      download(response.headers['location'], filepath);
    } else if (response.statusCode == 304) {
      console.log("No update required.");
    } else {
      console.log(`Downloading to "${filepath}"`);
      let fileprogress = 0;
      let filetotal    = 1;
      let file         = fs.createWriteStream(filepath);

      // Print file download progress
      filetotal = parseInt(response.headers['content-length']);
      response.on('data', (chunk) => {
        fileprogress += chunk.length;
        let progress = 100 * fileprogress / filetotal;
        process.stdout.write(`${fileprogress}B/${filetotal}B ${progress.toFixed(1)}%\r`);
      });

      // File download is finished; update the file modification date to match
      // the "last-modified" HTTP header for caching purposes.
      response.on('end', () => {
        file.end();
        console.log("\nDownload Complete.");
        let moddate = new Date(response.headers['last-modified']);
        fs.utimesSync(filepath, moddate, moddate);
      });

      response.pipe(file);
    }
  });

  request.on('error', (err) => {
    fs.unlinkSync(filepath);
    console.error("Failed to download file", err);
    process.exit(1);
  });
  request.end();
}

data.forEach((datum) => {
  let filename = path.basename(datum.src);
  let filepath = "data/" + filename;

  download(datum.src, filepath);
});
