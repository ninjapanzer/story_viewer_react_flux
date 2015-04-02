var webpack = require("webpack");
var path = require("path");
var bower_dir = __dirname + '/bower_components';
var resolveBowerPath = function(componentPath) {
    return path.join(bower_dir, componentPath);
};
module.exports = {
  entry: './src/app.coffee',
  devtool: "source-map",
  output: {
    path: './build',
    filename: 'story.min.js'
  },
  externals: ['React', 'Flux', 'jQuery', '_', '$', 'Backbone'],
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee-jsx-loader" }
      //{ test: /\.coffee$/, loader: "coffee" }
    ]
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({minimize: true})
  ],
  resolve: {
    extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
  }
};
