<template>
  <ul class="nav-links">
    <router-link
      v-for="link in navLinks"
      :key="link.name"
      :to="link.to"
      @click="closeRespTab"
    >
      {{ link.label }}
      <!-- <router-link :to="link.to" @click="closeRespTab">{{
        link.label
      }}</router-link> -->
    </router-link>
  </ul>
</template>

<script>
export default {
  data() {
    return {
      navLinks: [
        { name: "home", to: { name: "home" }, label: "Home" },
        { name: "products", to: { name: "products" }, label: "Products" },
        { name: "support", to: { name: "support" }, label: "Support" },
        { name: "cart", to: { name: "cart" }, label: "Cart" },
      ],
    };
  },

  methods: {
    closeRespTab() {
      let navbar = document.getElementById("navbar-cont");

      if (screen.width < 1050) {
        navbar.style.display = navbar.style.display == "flex" ? "none" : "flex";
      }
    },
  },
};
</script>

<style scoped>
.nav-links a {
  display: inline-block;
  padding: 10px;
  cursor: pointer;
}

.nav-links a {
  text-decoration: none;
  color: black;
  font-size: 18px;
  display: inline-flex;
  height: 30px;
  justify-content: center;
  align-items: center;
}

.nav-links a:hover {
  color: #556b2f;
}

.nav-links .router-link-exact-active {
  color: #556b2f;
  padding: 2px 10px;
  border-radius: 14px;
  background-color: #556b2f;
  color: #f5f5f5;
}

.nav-links .router-link-exact-active:hover {
  color: white;
}
</style>
