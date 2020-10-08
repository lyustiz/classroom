const { GenerateSW } = require("workbox-webpack-plugin");

module.exports = {
  publicPath: process.env.NODE_ENV === "development" ? "/public/js/" : "",

  configureWebpack: {
    plugins: [new GenerateSW()]
  }


  
};

