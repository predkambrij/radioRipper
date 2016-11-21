var express = require('express');
var fs = require('fs');
var router = express.Router();

router.get('/', function(req, res, next) {
  var urlPrefix = req.query.domain+"/mp3/music/";
  var list = {};

  var root = "/var/www/mp3/music";
  var subfolders = fs.readdirSync(root);
  for(subfolderi in subfolders) {
    var subfolderName = subfolders[subfolderi];
    if (subfolderName == ".keep") {
      continue;
    }
    var dir = root+"/"+subfolderName;
    var subfolderFiles = fs.readdirSync(dir);
    subfolderFiles.sort(function(a, b) {
      return (fs.statSync(dir +"/"+ a).mtime.getTime()
              - fs.statSync(dir  +"/"+  b).mtime.getTime());
    });
    var station_genre = subfolderName.split("_")
    if (!(station_genre[0] in list)) {
      list[station_genre[0]] = {
        "urlPrefix":urlPrefix,
        "subfolders": {
        }
      }
    }
    list[station_genre[0]]["subfolders"][subfolderName] = subfolderFiles;
  }

  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  res.send(JSON.stringify(list));
});

module.exports = router;
