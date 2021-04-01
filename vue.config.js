const { GenerateSW } = require("workbox-webpack-plugin");
const path = require('path');  

module.exports = {
  publicPath: process.env.NODE_ENV === "development" ? "/public/js/" : "",

  configureWebpack: {
    plugins: [new GenerateSW()],
    resolve: {  
      alias: {  
        '~'          : path.resolve(__dirname, './resources/js'),
        '@components': path.resolve(__dirname, './resources/js/components'),
        '@store'     : path.resolve(__dirname, './resources/js/store'),
        '@mixins'    : path.resolve(__dirname, './resources/js/mixins'),
        '@pages'     : path.resolve(__dirname, './resources/js/pages'),
        '@images'    : path.resolve(__dirname, './resources/js/assets/img'),
      },  
    },  
  }


  
};

