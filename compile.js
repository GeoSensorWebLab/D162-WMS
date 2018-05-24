// Compile all MML files to Mapnik XML stylesheets
const carto = require('carto');
const fs = require('fs');
const path = require('path');

const stylesDir = 'styles';

fs.readdir(stylesDir, (err, files) => {
  if (err) {
    throw err;
  }

  let mmlFiles = files.filter((file) => {
    return path.extname(file) === ".mml";
  });

  mmlFiles.forEach((mmlFile) => {
    let mmlPath = path.join(stylesDir, mmlFile);
    let data = fs.readFileSync(mmlPath, 'utf-8');
    let mml = new carto.MML({});

    mml.load(path.dirname(mmlPath), data, (err, mmlData) => {
      if (err) {
        throw err;
      }

      let output = new carto.Renderer({ filename: mmlPath }).render(mmlData);
      let basename = path.basename(mmlPath, ".mml");
      fs.writeFileSync(path.join(stylesDir, `${basename}.xml`), output.data);
    });
  });
});
