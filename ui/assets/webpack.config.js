const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');

module.exports = (env, options) => {
  const devMode = options.mode !== 'production';

  return {
    entry: './src/index.ts',
    module: {
      rules: [
        {
          test: /^src\/*\.tsx?$/,
          use: 'ts-loader',
          exclude: /node_modules/,
        },
      ],
    },
    resolve: {
      extensions: ['.tsx', '.ts', '.js'],
    },
    output: {
      filename: 'bundle.js',
      path: path.resolve(__dirname, '../priv/static/dist'),
    },
    plugins: [
      new CopyPlugin({
        patterns: [{ from: 'static/', to: '../' }],
      })
    ]
  }
};
