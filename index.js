'use strict';

var http = require('http');

var app = require('./lib/server')(process.env.PORT || 80);

var server = http.createServer(app);

server.listen(app.get('port'), function() {
  console.log('Express server listening on port ' + app.get('port'));
});
