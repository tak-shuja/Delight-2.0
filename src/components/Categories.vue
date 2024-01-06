<template>
  <div class="categ-container">
    <div class="heading">Top Categories</div>
    <div class="categories">
      <div class="card" v-for="category in categories">
        <img src="assets/logo-big.jpeg" alt="" class="img" />
        <label class="label">{{ category }}</label>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      categories: ["Dry Fruits", "Dried Fruits", "Kernels", "Saffron"],
    };
  },
};
</script>

<style scoped>
.categ-container {
  display: flex;
  flex-direction: column;
  width: 100%;
  background-color: #fdf2f2;
  padding: 48px;
}

.heading {
  text-align: center;
}

.categories {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  gap: 20px;
  flex-wrap: wrap;
}

.card {
  display: flex;
  flex-direction: column;
  width: 236px;
  background-color: #ffeded;
  padding: 8px 0;
  justify-content: flex-start;
  border-radius: 12px;
  border: none;
  box-shadow: 5px 5px 10px 0px rgba(18, 18, 18, 0.1);
  font-weight: bold;
  transition: 0.3s;
}

.card:hover {
  scale: 1.03;
}

.img {
  object-fit: contain;
  display: block;
  border-radius: 50%;
}

.label {
  font-size: 1.2rem;
  margin: 20px auto;
}

@media (max-width: 786px) {
  .card {
    scale: 0.1;
    color: red;
  }
}
</style>
