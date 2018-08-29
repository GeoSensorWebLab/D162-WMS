const carto = require('carto');
const fs    = require('fs');
const path  = require('path');

// Small class to compile a Carto project file (MML) to Mapnik 
// stylesheet (XML)
class CartoCompiler {
  constructor() {}

  compile(projectFile, mapnikXML) {
    console.log(`Compiling ${projectFile} to ${mapnikXML}`);

    let projectData = fs.readFileSync(projectFile, 'utf-8');
    let mml = new carto.MML({});
    
    mml.load(path.dirname(projectFile), projectData, (err, mmlData) => {
      if (err) {
        throw err;
      }

      let output = new carto.Renderer({ filename: projectFile }).render(mmlData);

      if (output.msg) {
        output.msg.forEach((v) => {
          if (v.type === 'error') {
              console.error(carto.Util.getMessageToPrint(v));
          } else if (v.type === 'warning') {
              console.warn(carto.Util.getMessageToPrint(v));
          }
        });
      }

      fs.writeFileSync(mapnikXML, output.data);
    });  
  }
}

module.exports = CartoCompiler;
