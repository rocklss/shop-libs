const path = require('path');

module.exports = {
  entry: {
    'main': './main.js'
  },
  output: {
    path: path.resolve(__dirname, '../assets'),
    filename: 'cw-[name].js'
  },
  module: {
    rules: [
      {
        test: /\.(sass|less|css)$/,
        use: [
          'style-loader',
          'css-loader',
          'sass-loader',
        ],
      },
    ],
  }
};
