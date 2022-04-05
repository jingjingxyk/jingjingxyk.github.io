const path = require('path');

var projectRoot = path.resolve(__dirname, '.');

const webpack = require("webpack");

module.exports = {
//  mode: "development",
  entry: {
    app: './src/main/main.js'
  },
  output: {
//    filename: "[chunkhash].js",
//    filename: "[hash].js",
//    filename: "main.js",
    filename: "[name].js",
    path: path.resolve(__dirname, 'gh-pages/dist'),
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          // style-loader
          {loader: 'style-loader'},
          // css-loader
          {
            loader: 'css-loader',
            options: {
              modules: true
            }
          },
          // sass-loader
          {loader: 'sass-loader'}
        ]
      },
      /*      {
              enforce: 'pre', // https://github.com/webpack-contrib/eslint-loader
              test: /\.js$/,
              exclude: /node_modules/,
              loader: 'eslint-loader',
              options: {
                // eslint options (if necessary)
              },
            },
            {
              enforce: 'pre',
              test: /\.vue$/,
              exclude: /node_modules/,
              loader: 'eslint-loader',
              options: {
                // eslint options (if necessary)
              },
            }, */
      {
        test: /\.m?js$/,
        exclude: /(node_modules|bower_components)/,
        include: projectRoot,
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: ["@babel/preset-env", "@babel/preset-react"],
              plugins: ["@babel/plugin-transform-runtime", "@babel/plugin-proposal-class-properties"]            }
          },
          {
            loader: "thread-loader"
          }
        ]
      },
      {
        test: /\.jsx$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ["@babel/preset-env", "@babel/preset-react"],
            plugins: ["@babel/plugin-transform-runtime", "@babel/plugin-proposal-class-properties"]
          }
        }
      },
      {
        test: /\.vue$/,

        include: projectRoot,
        exclude: /(node_modules|bower_components)/,
        use: [
          {
          loader: "thread-loader"
          },
          {
            loader: 'vue-loader',
          },
        ]
      },
      {
        test: /\.html$/,
        loader: 'html-loader',
        include: projectRoot,
        exclude: /(node_modules|bower_components)/,
      },
      {
        test: /\.(png|jpg|gif)$/i,
        use: [
          {
            loader: 'url-loader',
            options: {
              limit: 10000

            },
          },
        ],
      },
      {
        test: /\.(woff2?|eot|ttf|otf)(\?.*)?$/,
        use: [
          {
            loader: 'url-loader',
            options: {
              limit: 10000

            },
          },
        ],
      },
      {
        test: /\.json$/,
        loader: 'json-loader'
      },
      {
        test: /\.s[ac]ss$/i,
        use: [
          // Creates `style` nodes from JS strings
          'style-loader',
          // Translates CSS into CommonJS
          {
            loader: 'css-loader',
            options: { modules: true }
          },
          // Compiles Sass to CSS
          {
            loader: 'sass-loader',
            options: {
              indentedSyntax: true,
              // sass-loader version >= 8
              sassOptions: {
                indentedSyntax: true
              }
            }
          }
        ],
      },
      {
        test: /\.less$/,
        use: [
          {
            loader: 'style-loader', // creates style nodes from JS strings
          },
          {
            loader: 'css-loader', // translates CSS into CommonJS
          },
          {
            loader: 'less-loader', // compiles Less to CSS
          },
        ],
      },
      {
        test: /\.css$/,
        use: [
          {
            loader: 'css-loader',
            options: {
              importLoaders: 1,
              // enable CSS Modules
              modules: true,
              // customize generated class names
              localIdentName: '[local]_[hash:base64:8]'
            }
          },
          'postcss-loader'
        ]
      },
      {
        test: /\.styl(us)?$/,
        use: [
          'css-loader',
          'stylus-loader'
        ]
      }
    ]
  },
  resolve: {
    // root: path.join(__dirname, '../src'),
    extensions: ['.js', '.vue', ".json", ".jsx", ".css"],
    alias: {
      'src': path.resolve(__dirname, 'src'),
      'views': path.resolve(__dirname, 'src/views'),
      'api': path.resolve(__dirname, 'src/api'),
      'assets': path.resolve(__dirname, 'src/assets'),
      'components': path.resolve(__dirname, 'src/components')
    }
  },
  externals: {
    'react': 'React',
    'react-dom': 'ReactDOM',
    'angular': 'angular'
  },
  devtool: "source-map",
  performance: {
    hints: "warning", // enum
    maxAssetSize: 200000, // int (in bytes),
    maxEntrypointSize: 400000, // int (in bytes)
    assetFilter: function (assetFilename) {
      // Function predicate that provides asset filenames
      return assetFilename.endsWith('.css') || assetFilename.endsWith('.js');
    }
  },
  stats: "errors-only",

  plugins: [


    /*    new StyleLintPlugin({
          files: ['**!/!*.{vue,htm,html,css,sss,less,scss,sass}'],
        })*/
    new webpack.HotModuleReplacementPlugin({
      // Options...
    })
  ],
  devServer: {
    contentBase: path.join(__dirname, 'public'),
    compress: true,
    port: 9000,
    disableHostCheck: true,
    host: '0.0.0.0',
    hot: true,
    index: 'index.html',
    onListening: function(server) {
      const port = server.listeningApp.address().port;
      console.log('Listening on port:', port);
    },
    open: true,
    proxy: {
      '/api': 'https://www.xieyaokun.com'
    },
    pfx: '/dist',
    historyApiFallback: true, // true for index.html upon 404, object for multiple paths
    https: false, // true for self-signed, object for cert authority
    noInfo: true, // only errors & warns on hot reload
  }
};

/*
 Library from CDN: Use <scrit> tag and externals option
 Library from filesystem: Include the library in the bundle. (Maybe modify resolve options to find the library)

 externals: Make global vars available as module
 ProvidePlugin: Make modules available as free variables inside modules
 */
