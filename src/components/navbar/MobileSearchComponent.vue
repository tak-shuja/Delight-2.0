<template>
    <div class="search-tab">
      <input
        type="search"
        v-model="searchQuery"
        class="search-bar"
        placeholder="search...&#x1F50D"
        @keyup.enter="searchItems"
      />
    </div>
  </template>
  
  <script>
  import { cartStore } from "@/store/cartStore";
  
  export default {
    data() {
      return {
        searchAPIurl: "http://localhost:3000/public/php/search_product.php",
        searchQuery: "",
        cartStore: cartStore(),
      };
    },
  
    methods() {
      return {
        // Search for items
        searchItems() {
          this.cartStore.search_query = this.searchQuery;
          const data = { search_query: this.searchQuery };
  
          this.$router.push({ name: "/items" });
          console.log(this.$router);
          fetch(searchAPIurl, {
            method: "POST",
            body: JSON.stringify(data),
          })
            .then((resp) => resp.text())
            .then((data) => {
              this.cartStore.searchItems = data;
            })
            .catch((error) => console.error(`HTTP ERROR: ${error}`));
        },
      };
    },
  
    watch: {
      searchQuery: function (val) {
        this.cartStore.search_query = val;
      },
    },
  };
  </script>


<style scoped>

.search-bar {
    border-radius: 40px;
    border: none;
    box-shadow: 2px 4px 9px 1px rgba(0, 0, 0, 0.44);
    padding: 5px 12px;
    outline: nono;
    width: 80%;
    margin: auto;
    margin-top: 2px;
}
</style>
  