const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const fs = require('fs');
const folderName = JSON.parse(fs.readFileSync('entries.json', 'utf8'));

const entries = {};
const html = [];

for (let folder of folderName.src) {
  entries[folder] = path.resolve(__dirname, `src/${folder}/js/index.js`);

  html.push(new HtmlWebpackPlugin({
    title: folder,
    filename: `${folder}.html`,
    template: `src/${folder}/index.html`,
    chunks: [folder]
  }))
}

module.exports = {
  mode: 'development',
  entry: entries,
  output: {
    path: path.resolve(__dirname, 'dist/'),
    filename: '[name].js',
    clean: true,
    assetModuleFilename: '[name][ext]'
  },
  target: 'web',
  devServer: {
    static: {
      directory: path.resolve(__dirname, 'dist/')
    },
    historyApiFallback: true,
    port: 3000,
    open: true,
    hot: true
  },
  resolve: {
    extensions: ['.js']
  },
  module: {
    rules: [
      {
        test: /\.(js)$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
      },
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"]
      },
      {
        test: /\.(png|jpe?g|gif)$/i,
        use: ["file-loader"],
      },
      {
        test: /\.glsl$/,
        loader: 'webpack-glsl-loader'
      }
    ]
  },
  plugins: html
}