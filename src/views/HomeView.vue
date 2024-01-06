<template>
  <div class="home" v-if="homePage">
    <!-- <NavBar /> -->
    <HeadingItem />
    <!-- <CategoriesView /> -->
    <TopCategories />
    <FeaturesView />
    <ProductGallery />
    <FaqComponent />
    <!-- <CardItemVue /> -->
    <FooterView />
  </div>
  <div v-else></div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'

import NavBar from "@/components/NavBar.vue";
import HeadingItem from "@/components/HeadingView.vue";
import CategoriesView from "@/components/Categories.vue";
import FeaturesView from "@/components/HomeFeatures.vue";
import ProductGallery from "@/components/ProductGallery.vue";
import FaqComponent from "@/components/FaqComponent.vue";
import FooterView from "@/components/FooterView.vue";
import TopCategories from "@/components/TopCategories.vue";
export default {
  name: "HomeView",
  components: {
    NavBar,
    HeadingItem,
    // CategoriesView,
    TopCategories,
    FeaturesView,
    ProductGallery,
    FaqComponent,
    FooterView,
    // CardItemVue,
  },

  created() {
    window.localStorage.removeItem("selectedItem");
  },
  computed: {
    homePage() {
      if (this.$route.name == "home") {
        return true;
      } else {
        return false;
      }
    },
  },
};
</script>

<style>
a .router-link-exact-active {
  /* color: #42b983; */
  color: crimson;
}
</style>
