var connect = require('connect');
var http = require('http');
var prism = require('connect-prism');

prism.create({
  name: 'plot_point_api',
  context: '/plot_point',
  mode: 'proxy',
  host: 'localhost',
  port: 8080
});

prism.create({
  name: 'stories_api',
  context: '/stories',
  mode: 'proxy',
  host: 'localhost',
  port: 8080
});

prism.create({
  name: 'story_api',
  context: '/story',
  mode: 'proxy',
  host: 'localhost',
  port: 8080
});

prism.useVerboseLog();

var app = connect()
  .use(prism.middleware);
  //.use(connect.static('public'))

http.createServer(app).listen(4000);