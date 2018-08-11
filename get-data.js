// Download the shapefiles for the stylesheet
const path   = require('path');
const fs     = require('fs');
const http   = require('http');
const https  = require('https');
const moment = require('moment');
const rimraf = require('rimraf');
const tmp    = require('tmp');
const unzip  = require('unzip');
const URL    = require('url');

const data = require('./data.json');

function schemeForURI(uri) {
  return uri.startsWith('https') ? https : http;
}

function download(uri, filepath) {
  let promise = new Promise((resolve, reject) => {
    let url     = URL.parse(uri);
    let scheme  = schemeForURI(uri);
    let options = {
      method:   'GET',
      hostname: url.hostname,
      path:     url.pathname
    };

    if (fs.existsSync(filepath)) {
      console.log("File already exists, checking modification time");
      let stats = fs.statSync(filepath);
      console.log("Local file has modification date " + stats.mtime.toString());
      options.headers = options.headers || {};
      options.headers['if-modified-since'] = moment(stats.mtime).utc().format("ddd, DD MMM YYYY HH:mm:ss") + " GMT";
      console.log("Using If-Modified-Since: " + options.headers['if-modified-since']);
    }

    let request = scheme.request(options, (response) => {
      // Handle redirects
      if (response.statusCode >= 301 && response.statusCode < 304 && response.headers['location'] !== undefined) {
        console.log("Following redirect: " + response.headers['location']);
        resolve(download(response.headers['location'], filepath));
      } else if (response.statusCode == 304) {
        console.log("304 - No update required.");
        resolve();
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
          console.log("Setting modification time to " + moddate.toString());
          fs.utimes(filepath, moddate, moddate, (err) => {
            if (err) {
              reject(err);
            } else {
              resolve();
            }
          });
        });

        response.pipe(file);
      }
    });

    request.on('error', (err) => {
      fs.unlinkSync(filepath);
      console.error("Failed to download file", err);
      reject();
    });
    request.end();
  });

  return promise;
}

// Unpack the archive.
// Be smart about extracting archives of files, and put them in a directory, and
// don't double-nest directories if we don't have to.
function extract(archive) {
  // determine archive type
  switch(path.extname(archive)) {
    case '.zip':
    extractZIP(archive);
    break;
    default:
    console.warn(`No extraction handler implemented for ${archive}`);
  }
}

function extractZIP(archive) {
  tmp.tmpName({ dir: "data" }, (tmpErr, tmpPath) => {
    if (tmpErr) {
      throw tmpErr;
    }

    fs.mkdir(tmpPath, (mkdirErr) => {
      if (mkdirErr) {
        throw mkdirErr;
      }

      console.log(`Extracting ${archive}`);
      let extraction = fs.createReadStream(archive)
        .pipe(unzip.Extract({ path: tmpPath }));

      extraction.on('close', () => {
        // If tmp directory contains only one directory, then move that to
        // the data directory. Otherwise rename the tmp directory to be the
        // named extraction directory.
        fs.readdir(tmpPath, (readdirErr, files) => {
          if (readdirErr) {
            throw readdirErr;
          }

          if (files.length == 1) {
            console.log(`Moving extracted directory`);
            fs.rename(tmpPath + '/' + files[0], "data/" + files[0], (renameErr) => {
              if (renameErr) {
                throw renameErr;
              }
              rimraf.sync(tmpPath);
            });
          } else {
            console.log(`Renaming extracted directory`);
            let archiveName = "data/" + path.basename(archive, '.zip');
            rimraf.sync(archiveName);
            fs.rename(tmpPath, archiveName, (renameErr) => {
              if (renameErr) {
                throw renameErr;
              }
            });
          }
        });
      });
    })
  });
}

data.forEach((datum) => {
  let filename = path.basename(datum.src);
  let filepath = "data/" + filename;

  download(datum.src, filepath)
  .then(() => {
    extract(filepath);
  })
  .catch((err) => {
    console.error(err);
  });
});
