<template lang="">
  <div>
    <h1>File Upload</h1>

    <div>
      <input type="text" name="" id="" v-model="file" />
      <input type="file" @change="uploadFile" ref="file" />
      <button @click="submitFile" :disabled="isSubmitDisabled">Submit</button>
      <button @click="uploadImage" :disabled="sisSubmitDisabled">Upload</button>
    </div>
    <div>
      <p v-if="!!image">
        <br />
        <br />
        File name: {{ fileName }}
        <br />
        File size: {{ fileSize }} MB
        <br />
        File type: {{ fileType }} <br />Last Modified: {{ lastModified }}
      </p>
      <p>Response: {{ response }}</p>
      <p>{{ uploadPercentage }}</p>
    </div>
    <div v-if="isUploading">
      <h2>Uploading...</h2>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  data() {
    return {
      image: null,
      fileData: null,
      fileName: null,
      fileSize: null,
      fileType: null,
      lastModified: null,
      response: null,

      file: null,

      // btn disable code
      isSubmitDisabled: true,

      // check the right file extension
      rightFileExt: false,

      // upload indicator
      isUploading: false,

      // upload percentage
      uploadPercentage: 0,
    };
  },
  methods: {
    uploadFile() {
      this.image = this.$refs.file.files[0];
      // console.log(this.image);
      this.fileName = this.image.name;
      this.fileSize = this.bytesToMB(this.image.size);
      this.fileType = this.image.type;
      this.lastModified = this.image.lastModified;

      if (this.fileType.split("/")[0] != "image") {
        // this.isSubmitDisabled = true;
        this.response = "Please select an image(jpeg/png)";
      } else {
        // this.rightFileExt = true;
        this.isSubmitDisabled = false;
      }
    },

    uploadImage() {
      const formData = new FormData();
      // if (this.rightFileExt) {
      formData.append("filename", this.file);
      formData.append("file", this.image);

      axios
        .post("http://localhost:3000/public/php/file_upload.php", formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },

          onUploadProgress: (progressEvent) => {
            console.log(progressEvent);
            this.uploadPercentage =
              Math.round(progressEvent.loaded / progressEvent.total) * 100;
          },
        })

        .then((data) => {
          this.response = data.data;
          this.isUploading = false;
        })
        .catch((error) => (this.response = error));
    },

    submitFile() {
      const formData = new FormData();

      if (this.rightFileExt) {
        this.isUploading = true;
        formData.append("file", this.image);
        // console.log(formData);
        fetch("http://localhost:3000/public/php/file_upload.php", {
          // headers: headers,
          body: formData,

          method: "Post",
        })
          .then((resp) => resp.text())
          .then((data) => {
            this.response = data;
            this.isUploading = false;
          })
          .catch((error) => (this.response = error));
      } else {
        this.response = "Please select an image(jpeg/png)";
      }
    },

    // Convert bytes to mb
    bytesToMB(number) {
      return (number / 1_00_00_00).toPrecision(2);
    },
  },
};
</script>
<style lang=""></style>
