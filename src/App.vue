<template>
  <NavBar />

  <!-- {{ isLoggedIn }} -->
  <!-- <HomeView /> -->
  <router-view />
  <!-- <HomeView /> -->
  <FooterView />
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import HomeView from "./views/HomeView.vue";
import { onAuthStateChanged } from "firebase/auth";
import { auth } from "./main";
import { authStore } from "./store";
import FooterView from "./components/FooterView.vue";
export default {
  components: { NavBar, HomeView, FooterView },
  data() {
    return {
      store: authStore(),
      user: null,

      authStateChanged: () =>
        onAuthStateChanged(auth, (user) => {
          this.store.user = user;
          this.store.isAuthReady = true;
        }),
    };
  },
  created() {
    if (
      localStorage &&
      localStorage.getItem(
        "firebase:authUser:AIzaSyBfBi2HGkGNqduMQwXzQ8QciVgyyxSiijw:[DEFAULT]"
      )
    ) {
      let user = JSON.parse(
        localStorage[
          "firebase:authUser:AIzaSyBfBi2HGkGNqduMQwXzQ8QciVgyyxSiijw:[DEFAULT]"
        ]
      );
      this.store.user = user;
    } else {
      this.authStateChanged();
    }
  },

  computed: {
    isLoggedIn() {
      var user = this.store.user;
      return user ? true : false;
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  width: 100vw;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

a {
  text-decoration: none;
  color: black;
}
</style>
