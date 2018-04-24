<<<<<<< HEAD
var path = require('path');

module.exports = {
  entry: "./frontend/todo_redux.jsx",
  output: {
      filename: "bundle.js"
  },
  devtool: 'source-map',
  resolve: {
  extensions: ['.js', '.jsx', '*']
},
module: {
    loaders: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
=======
const path = require("path");

module.exports = {
  context: __dirname,
  entry: './frontend/todo_redux.jsx',
  output: {
    path: path.resolve(__dirname),
    filename: 'app/assets/javascripts/bundle.js'
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/],
        exclude: /node_modules/,
>>>>>>> w7d2/master
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
<<<<<<< HEAD
=======
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
>>>>>>> w7d2/master
  }
};
