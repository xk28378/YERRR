const fs = require('fs');
const parse = require('./parse');
function injest(){
    var data = fs.readFileSync('dsn_data.txt','utf8')
    var lines = data.trim().split("\n");
    var dsnEvents = lines.map(line => parse.parseLine(line));
    dsnEvents.splice(0,11);
    var headerTemp = lines.splice(1,9);
    var final = parse.parseHeader(headerTemp);
    final.events = dsnEvents;
    console.log(final);
}
injest();
