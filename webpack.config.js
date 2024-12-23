const path    = require('path')
const webpack = require('webpack')

module.exports = {
  mode: 'production',
  devtool: 'source-map',
  entry: {
    application: './app/assets/javascripts/application.js'
  },
  resolve: {
    modules: ['./app/assets/javascripts', './vendor/assets/javascripts', './node_modules'],
  },
  output: {
    filename: '[name].js',
    sourceMapFilename: '[file].map',
    chunkFormat: 'module',
    path: path.resolve(__dirname, 'app/assets/builds'),
  },
  plugins: [
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1
    })
  ]
}
