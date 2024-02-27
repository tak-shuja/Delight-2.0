<template>
  <div class="search-tab">
    <input
      type="search"
      v-model="searchQuery"
      class="search-bar"
      placeholder="search...&#x1F50D"
      />
      <!-- @keyup.enter="searchItems" -->
    <span
      class="material-symbols-outlined search-icon"
      title="search"
      >
      <!-- @click="searchItems" -->
      search
    </span>
  </div>
</template>

<script>
import { cartStore } from "@/store/cartStore";

export default {
  data() {
    return {
      searchAPIurl: "http://localhost:3000/public/php/search_product.php",
      searchQuery: "",
      cartStore: cartStore()
    };
  },

  methods() {
    return {
      // Search for items
      searchItems() {
        this.cartStore.search_query = this.searchQuery;
        const data = { search_query: this.searchQuery };

        this.$router.push({ name: "products" });
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
      if(this.$route.path != '/items') this.$router.push('/items')
      this.cartStore.search_query = val;
    },
  },
};
</script>



<style scoped>
/* Search Bar */

.search-tab {
  display: flex;
  gap: 20px;
  align-items: center;
  justify-content: center;
}

.search-bar {
  border: none;
  border-radius: 42px;
  box-shadow: 2px 4px 9px 1px rgba(0, 0, 0, 0.44);
  /* height: 26px; */
  /* width: 250px; */
  padding: 5px 12px;
  outline: none;
}

.search-icon {
  cursor: pointer;
}
</style>