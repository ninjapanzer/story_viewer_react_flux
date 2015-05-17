var webpack = require("webpack");
var path = require("path");
var bower_dir = __dirname + '/bower_components';
var resolveBowerPath = function(componentPath) {
    return path.join(bower_dir, componentPath);
};
webpackConfig = {
  entry: './src/app.coffee',
  devtool: "source-map",
  output: {
    path: './dist',
    filename: 'story.min.js'
  },
  externals: ['React', 'Flux', 'jQuery', '_', '$', 'Backbone'],
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee-jsx-loader" }
      //{ test: /\.coffee$/, loader: "coffee" }
    ]
  },
  devServer: {
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "*"
    }
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({minimize: true})
  ],
  resolve: {
    extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
  }
};

if(process.env.webpack != undefined){
  webpackConfig.output.path = './build'
}

module.exports = webpackConfig;
