<template>
  <div>
    <span v-show="false">{{ isLoggedIn }}</span>
    <Toast />
    <ConfirmDialog></ConfirmDialog>
  </div>

  <div class="cart-container" v-if="!!fetched_items.length">
    <div class="products">
      <h2 style="font-size: 30px; letter-spacing: 1px">Shopping Cart</h2>

      <div class="product" v-for="item in fetched_items">
        <div class="item" style="width: 100%;">
          <div class="product-item">
          <img
            @click="viewItem(item.item_name)"
            :src="imgLink + JSON.parse(item.paths)[0]"
            style="width: 140px; object-fit: cover; aspect-ratio: 1; cursor: pointer;"
          />
          <div class="name">
            <div class="name-heading">
              {{ item.item_name }}
            </div>
            <!-- <div class="name-subheading">Premium</div> -->
          </div>
          <div class="qty">
            <button class="plsbtn" @click="increment(item)">
              <span class="material-symbols-outlined">arrow_upward</span>
            </button>
            <!-- 2 -->
            {{ item.quantity }}
             <button class="minbtn" @click="decrement(item)">
              <span class="material-symbols-outlined">arrow_downward</span>
             </button>
            <!-- <div class="price">{{ item.price }}</div> -->
          </div>

          <div class="del-btn" @click="deleteFromCart(item)">
            <span class="material-symbols-outlined" >
              delete
            </span>
          </div>
        </div>
        <hr>
        </div>
        
      </div>

    </div>
    <div class="summary">
      <h2>Order Summary</h2>
      <div class="product-card" v-for="item in fetched_items">
        <div class="item">
          <img
            :src="imgLink + JSON.parse(item.paths)[0]" 
            style="width: 100px; object-fit: cover; aspect-ratio: 1;border-radius: 12px;"
            alt="Error" />
          <label class="name">
            <label class="name-heading">{{ item.item_name }} ({{ item.quantity }})</label>
            <label class="name-subheading">Premium</label>
          </label>
        </div>
        <div class="price">&#8377;{{item.price * item.quantity}}</div>
      </div>

      <hr />

      <div class="total">
        <h2>Total</h2>
        &#8377;{{ totalItemsValue() }}
      </div>
    </div>
  </div>

  <div v-else>
    <h1>Your cart seems to be empty</h1>
  </div>
</template>

<script>
import { authStore } from "@/store/index";
import { cartStore } from "@/store/cartStore";

// import the cart functionality
// import { updateCartItems } from "@/cart/index";
import ConfirmDialog from "primevue/confirmdialog";

export default {
  // external components
  components: {
    ConfirmDialog,
  },

  // Data

  data() {
    return {
      fetched_items: [],
      authStore: authStore(),
      cartStore: cartStore(),
      userLoggedIn: this.isLoggedIn,

      // cart items apis
      cartAPI: "http://localhost:3000/public/php/get_cart.php",
      updateCartAPI: "http://localhost:3000/public/php/update_cart.php",
      deleteItemAPI: "http://localhost:3000/public/php/delete_from_cart.php",

      imgLink: "https://delightheaven.in/Old/Upload%20Data/",
    };
  },

  // Computed
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

  // Watch for login
  watch: {
    userLoggedIn: function (val) {
      if (val) {
        this.getDataFromServer();
      }
    },
  },

  // methods
  methods: {
    // get data from server
    getDataFromServer() {
      const data = {
        uid: this.currentUser.uid,
      };

      fetch(this.cartAPI, {
        method: "POST",
        body: JSON.stringify(data),
      })
        .then((resp) => {
          if (resp.ok) {
            return resp.json();
            console.log(resp);
          } else {
            throw new Error("HTTP Error! Status Code: ", resp.status());
          }
        })
        .then((data) => {
          this.fetched_items = data;
          console.log(data);
        })

        .catch((error) => {
          console.error("Fetch Error: ", error);
        });
    },

    // update the cart items
    updateCartItems(product_id, updateValue) {
      const data = {
        uid: this.authStore.user.uid,
        product_id: product_id,
        updateValue: updateValue,
      };

      fetch(this.updateCartAPI, {
        body: JSON.stringify(data),
        headers: {
          "Content-type": "appplication/json",
        },
        method: "POST",
      })
        .then((resp) => {
          if (resp.ok) {
            return resp.text();
          } else {
            throw new Error("HTTP Error! Status Code: ", resp.status());
          }
        })
        .then((data) => {
          return data.status == "OK";
        });
    },

    // increment the quantity of item
    increment(item) {
      this.updateCartItems(item.product_id, 1);
      this.setItem(item);
      this.cartStore.increaseCount();
    },

    // decrement the quantity of item
    decrement(item) {
      this.setItem(item);
      if (item.quantity > 1) {
        this.updateCartItems(item.product_id, -1);
        this.cartStore.decreaseCount();
      } else {
        alert("Product quantity should be at least 1");
      }
    },

    // set the item in the store
    setItem(item) {
      this.cartStore.selectedItem = item;
    },

    // delete from product
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
          this.$moshaToast("Deleted Item", {
            type: "success",
            showIcon: true,
            timeout: 1500,
          });
        },
      });
    },

    // view the item
    viewItem(item) {
      this.$router.push(`/product?id=${item.split(" ").join("+")}`);
    },

    // show the total amount and price for checkout
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
        }
      }

      return amount;
    },
  },
};
</script>
