<template>
  <!-- The Data is {{ data }} -->

  <div class="item" v-for="item in data">
    <!-- <div class="items1" v-for="dataa in key"> -->
    id : {{ item.id }} => name: {{ item.item_name }}

    <!-- </div> -->
  </div>

  <div
    class="container-fluid"
    style="
      display: flex;
      flex-direction: row;
      flex-wrap: wrap;
      justify-content: center;
      align-items: center;
    "
  >
    <div class="item" v-for="item in fetched_items" v-if="itemsLoaded">
      <div class="row">
        <div class="card m-4" v-if="fetched_items.length > 0">
          <img
            :src="imgUrl + JSON.parse(item.paths)[0]"
            alt=""
            class="card-img"
            loading="lazy"
          />
          <div class="card-heading">
            <!-- Card Heading -->
            {{ item.item_name }}
          </div>

          <div class="card-buttons">
            <button class="view-item" @click="view_item(item.item_name)">
              View Item
              <!-- 🛒 -->
            </button>
            <button
              class="wishlist"
              :data-code="item.code"
              @click="this.sendCode(item.code)"
            >
              Add to Wishlist
              <!-- ❤️ -->
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="msg" v-else>
      <h2>
        <!-- No Items Found! <br />
        Please Check Your Connection And Try Again -->
        <!-- Loading... -->
        <div class="loader"></div>
      </h2>
    </div>
  </div>
</template>

<script>
import { useRouter } from "vue-router";

// const url = "https://delightheaven.in/../src/php/get_items.php";

export default {
  data() {
    return {
      router: useRouter(),
      // url: "https://delightheaven.in/../Old/src/php/get_items.php",
      url: "server/get_products.php",
      imgUrl: "https://delightheaven.in/../Old/Upload Data/",

      fetched_items: {},
      product_name: "",
      noItems: false,
      itemsLoaded: false,
    };
  },

  methods: {
    getItems() {
      // http://localhost:3000/public/server/get_items.php

      // const url = "http://localhost:3000/public/server/get_items.php";

      fetch(this.url)
        .then((resp) => resp.json())
        .then((data) => {
          this.fetched_items = data;
          if (data.length) {
            this.noItems = true;
            this.itemsLoaded = true;
          }
          // console.log(data);
        })
        .catch((error) => console.error(error));
    },

    view_item(product_name) {
      this.$router.push({ name: "product", query: { id: product_name } });
      console.log(this.$route);
      // this.product_name = product_name;
      // let formatted_product_name = product_name.split(" ").join("+");
      // //   http://delightheaven.in/Items/index.html?product=Kashmiri+Walnuts
      // window.location.href = `http://delightheaven.in/Items/index.html?product=${formatted_product_name}`;
    },
  },

  created() {
    this.getItems();
    console.log(this.fetched_items);
  },
};
</script>

<style scoped>
.msg {
  display: flex;
  justify-content: center;
  align-items: center;

  height: 400px;
  height: 60vh;
}

.loader {
  border: 8px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-top: 8px solid grey;
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.card {
  display: flex;
  flex-direction: column;
  /* width: 300px; */
  /* height: 440px; */
  width: 240px;
  height: 290px;
  justify-content: space-evenly;
  border-radius: 12px;
  background-color: #c5e1a5;
  box-shadow: 2px 2px 8px grey, -2px -2px 8px grey;
  /* background-color: rgb(49, 3, 3); */
  background-color: wheat;
}

.card-img {
  padding: 1em;
  height: 160px;
  background-size: cover;
  background-repeat: no-repeat;
}

.card-heading,
.card-description {
  display: block;
  text-align: center;
  color: #3d3d3d;
  /* color: white; */
}

.card-heading {
  font-size: 17px;
}

.card-description {
  font-size: 16px;
}

.card-buttons {
  display: flex;
  align-items: center;
  justify-content: space-around;
  flex-direction: column;
  gap: 0.5em;
  margin: 1em 0;
}

.card-buttons button {
  font-size: 13px;
  width: 75%;
  text-align: center;
  padding: 0.4em;
  border-radius: 8px;
  /* background-color: #689f38; */
  background-color: rgb(49, 3, 3);
  color: white;
  border: none;
}

@media (max-width: 768px) {
  .card {
    display: flex;
    flex-direction: column;
    /* width: 300px; */
    /* height: 440px; */
    width: 230px;
    height: 280px;
    justify-content: space-evenly;
    border-radius: 12px;
    box-shadow: 2px 2px 8px grey, -2px -2px 8px grey;
    /* border: 1px solid #7cb342; */
  }
}
</style>
