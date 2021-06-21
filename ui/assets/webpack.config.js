const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const HtmlPlugin = require('html-webpack-plugin');

module.exports = (env, options) => {
  const devMode = options.mode !== 'production';

  return {
    entry: './src/index.tsx',
    module: {
      rules: [
        {
          test: /\.tsx?$/,
          use: 'ts-loader',
          exclude: /node_modules/,
        },
        {
          // How we bundle our LESS files (use runs from bottom to top. so less-loader is run before postcss-loader)
          test: /\.less$/,
          use: [
            {
              loader: MiniCssExtractPlugin.loader,
              // options: {
              //   hmr: config.hmr, // Lets us hot reload changes to styles
              // },
            },
            {
              // Loads our CSS and creates CSS unique CSS module names
              loader: 'css-loader',
              options: {
                sourceMap: true,
                modules: {
                  auto: true, // true states that only .module files will get the random classnames. Regular .less files will be uneffected
                  localIdentName: '[name]__[local]___[hash:base64:5]',
                },
              },
            },
            {
              loader: 'postcss-loader',
              options: {
                postcssOptions: {
                  plugins: ['autoprefixer'], // See .browserlistrc for what we'll prefix for
                },
              },
            },
            {
              loader: 'less-loader', // Converts the LESS to CSS
              options: {
                lessOptions: {
                  javascriptEnabled: true, // bundle the compile time js in antd
                  relativeUrls: false, // keep urls as (../path) rather than converting to (/path)
                },
                sourceMap: true,
              },
            },
          ],
        },
      ],
    },
    resolve: {
      extensions: ['.tsx', '.ts', '.js'],
    },
    output: {
      filename: 'bundle.js',
      path: path.resolve(__dirname, '../priv/static/dist'),
      publicPath: '/dist'
    },
    plugins: [
      new HtmlPlugin({ template: './src/index.html' }),
      new MiniCssExtractPlugin({
        filename: '[name]-[hash].css',
        chunkFilename: '[name]-[hash].css',
        ignoreOrder: true, // Turn off warning since order doesn't matter due to using CSS Modules
      }),
      new CopyPlugin({
        patterns: [{ from: 'static/', to: '../' }],
      }),
    ]
  }
};
