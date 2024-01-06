const { defineConfig } = require("@vue/cli-service");
module.exports = defineConfig({
  transpileDependencies: true,
  publicPath: process.env.NODE_ENV === "production" ? "./" : "/",
  devServer: {
    historyApiFallback: true,
  },

  pages: {
    index: {
      entry: "src/main.js",
      template: "public/index.html",
      filename: "index.html",
    },
    upload: {
      entry: "src/file upload/main.js",
      template: "public/file upload/index.html",
      filename: "upload/index.html",
    },
  },

  // pages: {
  // index: {
  //   entry: "src/main.js",
  //   template: "public/index.html",
  //   filename: "index.html",
  //   title: "Home Page",
  // },
  // signup: {
  //   entry: "src/components/signup/main.js",
  //   template: "public/signup/index.html",
  //   filename: "register/index.html",
  //   title: "Signup",
  // },
  // product: {
  //   entry: "src/components/product/main.js",
  //   template: "public/product/index.html",
  //   filename: "product/index.html",
  // },
  // file_upload: {
  //   entry: "src/components/file_upload/main.js",
  //   template: "public/file upload/index.html",
  //   filename: "file_upload/index.html",
  // },
  // },
});
