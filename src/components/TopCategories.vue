<template>
  <div class="home-top-categories">
    <h1 class="home-text02">
      <span class="home-text03">TOP CATEGORIES</span>
      <br class="home-text04" />
    </h1>
    <div class="home-container06">
      <!-- class="feature-card1-feature-card categ-card feature-card1-root-class-name" -->
      <div class="categ-card" v-for="category in categories">
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

<style scoped>
.home-text03 {
  font-size: 26px;
}

.categ-card {
  width: 230px;
  height: 270px;

  border-radius: 18px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;
  box-shadow: 2px 2px 5px 3px #fdc4c4;
  padding: 30px 0;
  margin-top: 1rem;
}

.feature-card1-image {
  width: 180px;
}

.home-container06 {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-evenly;
  align-items: center;
  /* gap: 5px; */
  width: 100%;
}

@media screen and (max-width: 800px) {
  .categ-card {
    width: 150px;
    height: 180px;
  }

  .feature-card1-image {
    /* scale: 0.5; */
    width: 100px;
  }

  .feature-card1-heading {
    font-size: 18px;
  }
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
