// Compile all MML files to Mapnik XML stylesheets
const Compiler = require('./src/carto_compiler');
const fs       = require('fs');
const path     = require('path');

const stylesDir = 'styles';

fs.readdir(stylesDir, (err, files) => {
  if (err) {
    throw err;
  }

  let mmlFiles = files.filter((file) => {
    return path.extname(file) === ".mml";
  });

  let compiler = new Compiler();

  mmlFiles.forEach((mmlFile) => {
    let mmlPath = path.join(stylesDir, mmlFile);
    let basename = path.basename(mmlPath, ".mml");
    let outputPath = path.join(stylesDir, `${basename}.xml`);

    compiler.compile(mmlPath, outputPath);
  });
});
