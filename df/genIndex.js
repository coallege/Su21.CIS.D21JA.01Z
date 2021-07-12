const fs = require("fs");

process.chdir(__dirname);

const index = fs
   .readdirSync(".")
   .filter(f => true
      && f.startsWith("m")
      && f.endsWith(".html")
   );

fs.writeFileSync("index.js", `window.df = ${JSON.stringify(index)};`);
