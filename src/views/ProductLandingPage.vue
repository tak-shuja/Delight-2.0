<template>
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
    <div class="item" v-for="item in items" v-if="itemsLoaded">
      <ProductCard
        :product="item"
        class="m-3 my-4"
        @click="console.log(cartStore.search_query)"
      />
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
import { authStore } from "@/store/index";

import { addToCart } from "@/cart";

import { cartStore } from "@/store/cartStore";

// const url = 'https://delightheaven.in/../src/php/get_items.php';

import ProductCard from "@/components/ProductCard.vue";

export default {
  components: {
    ProductCard,
  },

  data() {
    return {
      url: "http://localhost:3000/public/php/get_items.php",
      imgUrl: "https://delightheaven.in/../Old/Upload Data/",
      // url: 'https://delightheaven.in/../Old/src/php/get_items.php',

      fetched_items: [],
      product_name: "",
      noItems: false,
      itemsLoaded: false,
      cartAPI: "http://localhost:3000/public/php/add_to_cart.php",
      authStore: authStore(),
      cartStore: cartStore(),
      watch_value: null,
      val: null,
    };
  },

  methods: {
    getItems() {
      fetch(this.url)
        .then((resp) => resp.json())
        .then((data) => {
          this.fetched_items = data;
          this.cartStore.searchedItems = data;
          if (data.length) {
            this.noItems = true;
            this.itemsLoaded = true;
          }
        })
        .catch((error) => console.error(error));
    },

    searchItems() {
      const data = { search_query: this.cartStore.search_query };
      fetch("http://localhost:3000/public/php/search_product.php", {
        method: "POST",
        body: JSON.stringify(data),
      })
        .then((resp) => resp.json())
        .then((data) => {
          // console.log(data);
          this.cartStore.searchedItems = data;
          // this.fetched_items = data;
        })
        .catch((error) => console.error(`HTTP ERROR: ${error}`));
    },
  },

  created() {
    this.getItems();
  },
  computed: {
    fetchedProducts() {
      console.log("DATA CHANGED");
      return this.fetched_items;
    },

    items() {
      return this.cartStore.searchedItems;
    },
  },

  watch: {
    searchQuery: function (val) {
      // console.log(val);
      if (val) {
        console.log(val);
        this.searchItems();
      }
    },

    "cartStore.search_query": function (val) {
      if (val) {
        this.searchItems();
      } else {
        this.getItems();
      }
    },
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
