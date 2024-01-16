<template>
  <!-- {{ product }}
  {{ product.name }}
  {{ product.price }} -->

  <!-- One -->

  <div class="card-container-one" v-if="product.item_name">
    <!-- two -->
    <!-- <div class="card-header"> -->
    <span class="card-title">{{ product.item_name }}</span>
    <!-- <span class="card-rating">
        <span class="rating">4.5</span>
        <span class="starts"> </span>
      </span> -->
    <!-- </div> -->
    <!-- nine -->
    <div class="product-card-body">
      <img :src="imgUrl + JSON.parse(product.paths)[0]" class="product-image" />
    </div>
    <div class="card-footer">
      <div class="card-desc">
        <span class="quantity"> Price per 500g</span>
        <span class="price">${{ product.price }}</span>
      </div>
      <div class="card-btns">
        <button class="btn-view" @click="view_item(product.item_name)">
          View Item
        </button>
        <button class="btn-cart" @click="addToCart(product)">
          Add to cart
        </button>
      </div>
    </div>
  </div>
  <div v-else>
    <h1>Product not found!</h1>
  </div>
</template>

<script>
import { addToCart } from "@/cart/index";
import { authStore } from "@/store/index";
export default {
  props: ["product"],
  data() {
    return {
      imgUrl: "https://delightheaven.in/../Old/Upload Data/",
      authStore: authStore(),
    };
  },

  // Methods
  methods: {
    // View product

    view_item(product_name) {
      console.log(product_name);
      this.$router.push({ name: "product", query: { id: product_name } });
    },

    // Add product to cart
    async addToCart(product) {
      const result = await addToCart(product, this.authStore, this.isLoggedIn);

      if (result) {
        this.$moshaToast("Item added to cart", {
          type: "success",
          showIcon: true,
          timeout: 1500,
        });
      } else {
        this.$moshaToast("Some error occured", {
          type: "danger",
          showIcon: true,
          timeout: 1500,
        });
      }
    },
  },

  computed: {
    isLoggedIn() {
      return this.authStore.user ? true : false;
    },
  },
};
</script>

<style scoped>
.card-container-one {
  width: 230px;
  height: 315px;
  display: flex;
  /* padding: 5px; */
  box-shadow: 5px 5px 10px 0px #d4d4d4;
  border-radius: 8px;
  flex-direction: column;
  /* background-image: linear-gradient(90deg, #f5deb3, saddlebrown); */
  /* background-color: #f5deb3; */
  /* background-color: #f7dfb5; */
  /* background-color: #98633b; */
  /* background-color: #220202; */
  /* background-color: #3d0909; */
  background-color: #556b2f;
  /* background-color: #72884a; */

  /* background: linear-gradient(to bottom left, #72884a, #556b2f); */

  color: white;
}

.card-title {
  font-size: 18px;

  margin-top: 5px;
  text-align: left;
  width: 100%;
  display: inline-block;
  /* height: 0; */
  padding: 0 1rem;
  overflow-x: hidden;
}

.product-card-body {
  width: 100%;
  display: inline-flex;
}

.product-image {
  object-fit: cover;
  width: 190px;
  margin: auto;
  aspect-ratio: 1;
  border-radius: 40px;
}

.card-desc {
  display: flex;
  flex-direction: column;
  width: 40%;
  /* position: relative;
  bottom: 5px;
  right: 8px; */
  color: #cdc;
  font-weight: bold;
  text-align: left;
}
.quantity {
  display: inline-block;
  font-size: 12px;
  line-height: 1;
}

.price {
  font-size: 16px;
}

.card-footer {
  display: inline-flex;
  /* padding: 0.3rem 1rem; */
  margin-top: 5px;
}

.card-btns {
  width: 135px;
  height: 100%;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: space-between;
  gap: 5px;
  align-items: center;
  /* border: 1px solid white; */
  /* position: relative;
  bottom: 5px; */
}

.card-btns *:hover {
  scale: 1.02;
  transition: all 0.2s;
}

.btn-view,
.btn-cart {
  box-shadow: 1px 1px 3px #111;
  cursor: pointer;
  width: 100px;
  height: 25px;
  font-size: small;
  display: inline-block;
  border-radius: 8px;
  text-align: center;
  border: none;
}

.btn-view {
  color: black;
  background: white;
}

.btn-cart {
  background: black;
  color: white;
}

* {
  border: none;
}
</style>
