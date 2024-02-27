<template>
  <div v-show="homePage">
    <nav class="div nav">
      <img loading="lazy" src="assets/logo-big-cropped.jpeg" class="logo" />

      <div class="hamburger-icon">
        <input type="checkbox" name="" id="cbox" @click="check" />
        <span v-if="isMobileView">
          <i class="material-symbols-outlined"> search </i>
        </span>
        <label
          class="material-symbols-outlined"
          id="menu"
          for="cbox"
          @click="hidden = !hidden"
        >
          menu
        </label>
      </div>

      <div class="navopt-container" id="navbar-cont">
        <div class="resp-tab">
          <h1 class="resp-title">Delight De Heaven</h1>
          <span
            class="material-symbols-outlined"
            id="close-resp-tab"
            @click="closeRespTab"
          >
            close
          </span>
        </div>

        <NavLinks />
        <SearchComponent v-if="!isMobileView" />
        <ProfileComponent :isLoggedIn="isLoggedIn" :userEmail="userEmail" />
      </div>
    </nav>
    <MobileSearchComponent v-if="isMobileView" />

    <div v-if="isMobileView">
      {{ isMobileView }}
      <SearchComponent />
    </div>
  </div>
</template>

<script>
import { authStore } from "@/store";
import SearchComponent from "./navbar/SearchComponent.vue";
import ProfileComponent from "./navbar/ProfileComponent.vue";
import NavLinks from "./navbar/NavLinks.vue";
import MobileSearchComponent from "./navbar/MobileSearchComponent.vue";
export default {
  components: {
    SearchComponent,
    ProfileComponent,
    NavLinks,
    MobileSearchComponent,
  },

  data() {
    return {
      hidden: false,
      searchQuery: "",
      showNav: true,

      store: authStore(),
    };
  },

  methods: {
    check() {
      let navbar = document.getElementById("navbar-cont");
      navbar.style.display = navbar.style.direction == "flex" ? "none" : "flex";
    },
    redirectToRegisterPage() {
      this.$router.push({ name: "register" });
    },
    signout() {
      this.store.signout();
      this.$router.push({ name: "home" });
    },

    redirectToCart() {
      this.$router.push({ name: "cart" });
    },
  },
  computed: {
    homePage() {
      return !["/register", "/product", "/login"].includes(this.$route.path);
    },
    isLoggedIn() {
      return this.store.user ? true : false;
    },

    userEmail() {
      return this.isLoggedIn ? this.store.user.email : "Loading...";
    },

    isMobileView() {
      return screen.width < 800;
    },

    closeRespTab() {
      let navbar = document.getElementById("navbar-cont");

      if (screen.width < 1050) {
        navbar.style.display = navbar.style.display == "flex" ? "none" : "flex";
      }
    },
  },
};
</script>

<style>
* {
  user-select: none;
  user-zoom: none;
}

ul {
  margin: 0;
}

#cbox {
  display: none;
}
.nav {
  display: flex;
  justify-content: space-around;
  align-content: space-between;
  align-self: center;
  align-items: center;
  width: 95%;
  gap: 20px;
  box-shadow: 2px 4px 9px 2px rgba(0, 0, 0, 0.44);
  border-radius: 45px;
  margin: 15px auto;
  margin-top: 30px;
  padding: 0 8px;
}

.logo {
  object-fit: contain;
  object-position: center;
  width: 60px;
  overflow: hidden;
  max-width: 100%;
  margin: 2px;
  border-radius: 50%;
}

.navopt-container {
  display: flex;
  flex-direction: row;
  border-radius: 42px;

  gap: 70px;
}

.icon-label {
  display: none;
}

/* Profile Buttons */
.profile-btn {
  border-radius: 50%;
  border: none;
  border: 1px solid black;
  background: transparent;
  cursor: pointer;
}

.hamburger-icon {
  display: none;
}

.resp-tab {
  display: none;
}

#shopping-cart-icon {
  font-size: 32px;
}

@media only screen and (max-width: 1100px) {
  .nav-links a {
    font-size: 14px;
  }

  .login-btn,
  .signup-btn {
    font-size: 10px;
  }
}

@media (max-width: 1050px) {
  .nav-links a {
    font-size: 16px;
  }

  .login-btn,
  .signup-btn {
    font-size: 13px;
  }
}

@media (max-width: 1050px) {
  * {
    font-family: "Ubuntu Mono", monospace;
  }

  /* ACCOUNT TAB */
  .account-tab {
    position: absolute;
    border: 1px solid;
    width: 211px;
    height: 177px;
    padding: 5px 10px;
    right: 2.7rem;
    border-radius: 8px;
    -webkit-backdrop-filter: blur(4px);
    backdrop-filter: blur(4px);
    background: transparent;
    top: 6.7rem;
    display: none;
  }

  .nav-links li,
  .nav-links ul {
    padding: 0;
  }

  .nav {
    padding: 4px 4px;
    margin: 0;
    border-radius: 40px;
    background-color: white;
    margin: auto;
  }

  #menu {
    cursor: pointer;

    padding: 5px;
  }
  .navopt-container {
    transition: 0.4s;
    display: none;
    position: absolute;

    top: 0.25rem;

    z-index: 1;
    background-color: white;
    flex-direction: column;
    width: 95%;
    gap: 0;

    margin: auto;

    box-shadow: 3px 3px 10px 2px rgba(0, 0, 0, 0.44);
  }

  .navopt-container * {
    display: block;
    margin: 20px;
  }

  .nav-links {
    display: flex;
    flex-direction: column;
    padding: 0;

    font-family: "Ubuntu Mono", monospace;
  }

  .nav-links a {
    display: inline-block;
    width: min-content;

    padding: 0;
    margin: 0;
    height: 30px;
    text-align: center;
    font-size: 19px;
    letter-spacing: 1px;
  }

  .profile-tab button {
    margin: 12px auto;
    width: 62%;
    padding: 8px 4px;
  }

  .search-tab {
    display: flex;
    align-items: center;
  }

  .search-tab * {
    margin: 0;
    padding: 0;
  }

  .search-bar {
    width: 80%;
    height: 40px;
    padding: 5px 10px;
    font-size: 18px;
  }

  .hamburger-icon {
    display: block;
    cursor: pointer;
  }

  .nav {
    gap: 60%;
  }

  .resp-tab {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .resp-title {
    font-weight: bold;
    font-size: 20px;
    font-family: "Allura", cursive;
    font-family: "Merienda", cursive;
    font-family: "Ubuntu Mono", monospace;
  }

  #close-resp-tab {
    cursor: pointer;
    font-size: 24px;
  }

  .icon-label {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    gap: 10px;
  }

  .icon-label * {
    display: inline;
    padding: 0;
    margin: 0;
  }

  .icon-label :first-child {
    font-size: 20px;
  }

  .icon-label:last-child {
    font-size: 20px;
  }

  #shopping-cart-icon {
    display: none;
  }
}
</style>
