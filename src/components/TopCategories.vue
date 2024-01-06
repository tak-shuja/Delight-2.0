<template>
  <div class="home-top-categories">
    <h1 class="home-text02">
      <span class="home-text03">TOP CATEGORIES</span>
      <br class="home-text04" />
    </h1>
    <div class="home-container06">
      <div
        class="feature-card1-feature-card feature-card1-root-class-name"
        v-for="category in categories"
      >
        <img
          src="assets/logo-big.jpeg"
          alt="image"
          class="feature-card1-image"
        />
        <h2 class="feature-card1-heading">
          <span>{{ category }}</span>
        </h2>
      </div>
    </div>
  </div>
</template>

<style>
.home-text03 {
  font-size: 30px;
}

.home-container06 {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-evenly;
  align-items: center;
  gap: 20px;
  width: 100%;
}
</style>

<script>
export default {
  data() {
    return {
      categories: ["Dry Fruits", "Dried Fruits", "Kernels", "Saffron"],
    };
  },
};
</script>
