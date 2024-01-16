import { defineStore } from "pinia";
import { authStore } from "./index";

export const cartStore = defineStore("user_cart", {
  setup: () => ({
    selectedItem: null,
    search_query: null,
    searchedItems: [],
  }),

  actions: {
    setItem(item) {
      this.selectedItem = item;
    },
    increaseCount() {
      this.selectedItem.quantity++;
    },
    decreaseCount() {
      this.selectedItem.quantity--;
    },

    // Add the add to cart functionality
    addToCart(product) {
      if (this.isLoggedIn) {
        const data = {
          code: product.code,
          user_id: authStore().user.uid,
          product_id: product.id,
          product_price: product.price,
        };

        fetch(this.cartAPI, { method: "POST", body: JSON.stringify(data) })
          .then((resp) => {
            if (!resp.ok) {
              console.error("Fetch Error! HTTP status: ", resp.text());
            }
            resp.text();
          })
          .then((data) => {
            console.log("BACKEND RESPONSE: ", data);
          })
          .catch((error) => console.error(error));
      }
    },

    isLoggedIn() {
      return authStore().user ? true : false;
    },
  },
});
