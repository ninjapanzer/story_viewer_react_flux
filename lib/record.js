var connect = require('connect');
var http = require('http');
var prism = require('connect-prism');

prism.create({
  name: 'plot_point_api',
  context: '/plot_point',
  mode: 'mockrecord',
  host: 'localhost',
  port: 3000
});

prism.create({
  name: 'plot_point_api',
  context: '/plot_points',
  mode: 'proxy',
  host: 'localhost',
  port: 3000
});

prism.create({
  name: 'stories_api',
  context: '/stories',
  mode: 'mockrecord',
  host: 'localhost',
  port: 3000
});

prism.create({
  name: 'story_api',
  context: '/story/',
  mode: 'mockrecord',
  host: 'localhost',
  port: 3000
});

prism.create({
  name: 'main',
  context: '/',
  mode: 'proxy',
  host: 'localhost',
  port: 8080
});

prism.useVerboseLog();

var allowCrossDomain = function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  next();
};

var app = connect()
  .use(prism.middleware)
  .use(allowCrossDomain);
  //.use(connect.static('public'))

http.createServer(app).listen(8090);