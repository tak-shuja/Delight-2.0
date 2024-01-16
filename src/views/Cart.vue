<template>
  <div class="userLoggedIn" v-if="isLoggedIn">
    <!-- <h1>Logged In: {{ isLoggedIn }}</h1>
    <h2>User email: {{ userEmail }}</h2>
    <h2>User id: {{ currentUser.uid }}</h2> -->

    <!-- <PopupModal /> -->
    <Toast />
    <ConfirmDialog></ConfirmDialog>


    <div v-show="!!fetched_items.length">
      



<div
  v-for="item in fetched_items"
  style="
    display: inline-block;
    width: 200px;
    margin: 5px 10px;
    border-radius: 6px;
    padding: 5px;
    background-color: #556b2f;
    color: white;
  "
>
  <!-- <p>{{ item }}</p> -->
  <div>
    <span
      @click="viewItem(item.item_name)"
      class="material-symbols-outlined"
      style="
        width: 100%;
        text-align: end;
        margin-right: 10px;
        cursor: pointer;
      "
      >ungroup</span
    >
    <img
      @click="console.log(item.paths[0])"
      :src="imgLink + JSON.parse(item.paths)[0]"
      style="width: 170px; object-fit: cover; aspect-ratio: 3/2"
    />
    <p>{{ item.item_name }}</p>
    <!-- <p>{{ item.price }}</p> -->

    <p>
      <span><button @click="increment(item)">+</button></span>
      {{ item.quantity }}
      <span><button @click="decrement(item)">-</button></span>
    </p>
  </div>

  <p>
    <button
      @click="deleteFromCart(item)"
      style="
        background-color: red;
        color: white;
        border: none;
        border-radius: 8px;
        width: 100px;
        cursor: pointer;
      "
      title="delete item"
    >
      <span class="material-symbols-outlined"> delete </span>
    </button>
  </p>

  <!-- Product Quantity and total price -->



</div>


<div>
<p>
  Total amount of items: {{ totalItemsAmount() }}, Total amount of items
  value: Rs. {{ totalItemsValue() }}.
</p>

</div>
    </div>

    <div v-show="!fetched_items.length">
      <h1>Your cart seems to be empty!</h1>
      <p><button @click="$router.push('/items')">Continue Shopping</button></p>
    </div>
  </div>

  <div class="anonymousUser" v-else>
    <h2>Your cart is empty!</h2>
    <p>
      <div class="cart">
        <div class="heading">
        </div>
        <button class="btnSin" @click="$router.push('/login')">
          Sign In
        </button>
        <button class="btnSup" @click="$router.push('/register')">
          Register
        </button>
      </div>
    </p>
  </div>
</template>

<script>
import { authStore } from "@/store/index";
import { cartStore } from "@/store/cartStore";

// import the cart funcionality
import {updateCartItems} from '@/cart/index'

import ConfirmDialog from "primevue/confirmdialog";
// import ProductCard from "@/components/ProductCard.vue"



export default {
  // external components
  components: {
    
    ConfirmDialog,
    // ProductCard
  },

  // DATA

  data() {
    return {
      fetched_items: [],
      authStore: authStore(),
      cartStore: cartStore(),
      userLoggedIn: this.isLoggedIn,

      // Cart Items API
      cartAPI: "http://localhost:3000/public/php/get_cart.php",
      updateCartAPI: "http://localhost:3000/public/php/update_cart.php",
      deleteItemAPI: "http://localhost:3000/public/php/delete_from_cart.php",

      // Image Links
      imgLink: "https://delightheaven.in/Old/Upload%20Data/",


      
      
    };
  },

  // COMPUTED

  computed: {
    isLoggedIn() {
      this.userLoggedIn = this.authStore.user ? true : false;
      return this.authStore.user ? true : false;
    },

    userEmail() {
      return this.isLoggedIn ? this.authStore.user.email : "Loading...";
    },

    currentUser() {
      return this.isLoggedIn ? this.authStore.user : "Loading...";
    },
  },

  // WATCH FOR LOGIN
  watch: {
    userLoggedIn: function (val) {
      if (val) {
        this.getDataFromServer();
      }
    },
  },

  // METHODS
  methods: {
    // Method to get the data from the server
    getDataFromServer() {
      const data = { uid: this.currentUser.uid };
      fetch(this.cartAPI, { method: "POST", body: JSON.stringify(data) })
        .then((resp) => resp.json())
        .then((data) => {
          this.fetched_items = data;
        })
        .catch((error) => console.error(error));
      
    },

    // Method to update the cart item
    updateCartItems(product_id, updateVal) {

      const data =  {
          uid: this.authStore.user.uid,
          product_id: product_id,
          updateValue: updateVal,
        }
      updateCartItems(data)

    },

    // increment the cart item's quantity
    increment(item) {
      this.updateCartItems(item.product_id, 1);
      this.setItem(item);
      this.cartStore.increaseCount();
    },

    // decrement the cart item's quantity
    decrement(item) {
      this.setItem(item);
      if (item.quantity > 1) {
        this.updateCartItems(item.product_id, -1);
        this.cartStore.decreaseCount();
      } else {
        alert("Product qty should be at least 1");
      }
    },

    // set the item in the store
    setItem(item) {
      this.cartStore.selectedItem = item;
    },

    // delete the product
    deleteFromCart(product) {
      const data = {
        uid: this.authStore.user.uid,
        product_id: product.product_id,
      };

      this.$confirm.require({
        message: `Are you sure to delete '${product.item_name}' from your cart?`,
        header: "Confirmation",
        icon: "pi pi-times",
        accept: () => {
          fetch(this.deleteItemAPI, {
            body: JSON.stringify(data),
            method: "POST",
          })
            .then((resp) => resp.json())
            .then((data) => {
              if (data.message == "deleted") {
                const index = this.fetched_items.indexOf(product);
                this.fetched_items.splice(index, 1);
              }
            })
            .catch((error) => console.error(error));
          this.$moshaToast("Deleted Item", { type: "success", showIcon: true, timeout: 1500 });
        },
      });

    },

    // View the item
    viewItem(item) {
      this.$router.push(`/product?id=${item.split(" ").join("+")}`);
    },


    // Show the total amount and total price for checkout
    totalItemsAmount() {
      if (this.isLoggedIn) {
        return this.fetched_items.length;
      }
    },

    totalItemsValue() {
      let amount = 0;
      if (this.isLoggedIn) {
        for (let item of this.fetched_items) {
          amount += Number.parseInt(item.price) * item.quantity;
          // amount *= item.quantity;
        }
      }
      return amount;
    },

  },
};
</script>
