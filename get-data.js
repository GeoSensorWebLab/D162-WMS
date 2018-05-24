// Download the shapefiles for the stylesheet
const path  = require('path');
const fs    = require('fs');
const http  = require('http');
const https = require('https');
const URL   = require('url');

const data = require('./data.json');

function download(uri, filepath) {
  const url = URL.parse(uri);

  if (uri.startsWith('https')) {
    scheme = https;
  } else {
    scheme = http;
  }

  let file = fs.createWriteStream(filepath);
  let fileprogress = 0;
  let filetotal = 1;
  let request = scheme.request({
    method: 'GET',
    hostname: url.hostname,
    path: url.pathname
  }, (response) => {
    console.log(response.statusCode);
    console.log(response.headers);

    // Handle redirects
    if (response.statusCode >= 300 && response.statusCode < 400 && response.headers['location'] !== undefined) {
      console.log("Following redirect");
      fs.unlinkSync(filepath);
      download(response.headers['location'], filepath);
    } else {
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

  // If file exists, do a conditional GET.
  if (fs.existsSync(filepath) && fs.statSync(filepath).size !== 0) {
    console.log(`"${datum.name}" exists at "${filepath}", checking for update`);
  } else {
    console.log(`Downloading "${datum.name}" to "${filepath}"`);
    download(datum.src, filepath);
  }
});
