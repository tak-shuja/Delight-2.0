<template>
  <div v-show="homePage">
    <nav class="div nav">
      <img loading="lazy" src="assets/logo-big-cropped.jpeg" class="logo" />
      <div class="hamburger-icon">
        <input type="checkbox" name="" id="cbox" @click="check" />
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
        <ul class="nav-links">
          <li>
            <router-link :to="{ name: 'home' }" @click="closeRespTab"
              >Home</router-link
            >
          </li>
          <li>
            <router-link :to="{ name: 'products' }" @click="closeRespTab"
              >Products</router-link
            >
          </li>
          <!-- <li><router-link :to="{ name: 'product' }">PRODUCT</router-link></li> -->
          <li>
            <router-link :to="{ name: 'support' }" @click="closeRespTab"
              >Support
            </router-link>
          </li>

          <li>
            <router-link :to="{ name: 'cart' }" @click="closeRespTab"
              >Cart
            </router-link>
          </li>

          <!-- <a class="icon-label" @click="$router.push('/cart')">
            <span class="nav-links"> Shopping cart </span> -->
          <!-- <span
              class="material-symbols-outlined"
              id="shopping-cart-icon-resp"
              @click="$router.push('/cart')"
              style="cursor: pointer"
              title="Your Cart"
            >
              shopping_cart
            </span> -->
          <!-- </a> -->
        </ul>

        <div class="search-tab">
          <input
            type="search"
            v-model="searchQuery"
            class="search-bar"
            placeholder="search..."
            @keyup.enter="searchItems"
          />
          <span
            class="material-symbols-outlined search-icon"
            title="search"
            @click="searchItems"
          >
            search
          </span>
        </div>

        <div class="profile-tab">
          <span
            class="material-symbols-outlined"
            id="shopping-cart-icon"
            @click="$router.push('/cart')"
            style="cursor: pointer"
          >
            shopping_cart
          </span>

          <span v-if="!isLoggedIn" style="display: flex; gap: 3px">
            <button class="login-btn" @click="$router.push('/login')">
              Login
            </button>
            <button class="signup-btn" @click="$router.push('/register')">
              Register
            </button>
          </span>
          <span v-else>
            <!-- <button class="profile-btn" @click="$router.push('/profile')"> -->
            <!-- Profile -->
            <!-- <i class="material-symbols-outlined">person</i>
            </button> -->
            Signed in as {{ userEmail }}
            <button @click="signout">Sign Out</button>
          </span>
        </div>
        <!-- <div class="profile-tab" v-else></div> -->
      </div>
    </nav>
  </div>
</template>

<script>
import { authStore } from "@/store";
import { cartStore } from "@/store/cartStore";

export default {
  data() {
    return {
      display: "none",
      hidden: false,
      store: authStore(),
      searchQuery: "",
      cartStore: cartStore(),
    };
  },

  methods: {
    closeRespTab() {
      let navbar = document.getElementById("navbar-cont");
      // alert(this.hidden);
      if (screen.width < 800) {
        navbar.style.display = navbar.style.display == "flex" ? "none" : "flex";
        // this.hidden = true;
      }
    },
    check() {
      let navbar = document.getElementById("navbar-cont");

      navbar.style.display = navbar.style.direction == "flex" ? "none" : "flex";
    },
    redirectToRegisterPage() {
      this.$router.push({ name: "register" });
    },
    signout() {
      this.store.signout();
      // this.store.user = null;
      this.$router.push("/");
    },

    redirectToCart() {
      this.$router.push("/cart");
    },

    // Search for items
    searchItems() {
      this.cartStore.search_query = this.searchQuery;
      // console.log(this.cartStore.search_query);

      const data = { search_query: this.searchQuery };
      fetch("http://localhost:3000/public/php/search_product.php", {
        method: "POST",
        body: JSON.stringify(data),
      })
        .then((resp) => resp.text())
        .then((data) => {
          this.cartStore.searchItems = data;
        })
        .catch((error) => console.error(`HTTP ERROR: ${error}`));
    },
  },
  computed: {
    homePage() {
      if (
        this.$route.path == "/register" ||
        this.$route.path == "/product" ||
        this.$route.path == "/login"
      ) {
        return false;
      } else {
        return true;
      }
    },

    isLoggedIn() {
      return this.store.user ? true : false;
    },

    userEmail() {
      return this.isLoggedIn ? this.store.user.email : "Loading...";
    },
  },

  watch: {
    searchQuery: function (val) {
      this.cartStore.search_query = val;
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
  width: 100%;
  width: 95%;
  gap: 20px;
  box-shadow: 2px 4px 9px 2px rgba(0, 0, 0, 0.44);
  border-radius: 45px;
  margin: 15px auto;
  margin-top: 30px;
  /* position: fixed; */
  /* top: 0px; */
  /* z-index: 100; */
  padding: 12px 8px;
  /* background-color: #556b2f; */

  /* margin-bottom: calc(1vh); */
}

.logo {
  /* aspect-ratio: ; */
  object-fit: contain;
  object-position: center;
  width: 70px;
  overflow: hidden;
  max-width: 100%;
  margin-left: 10px;
  border-radius: 50%;
}

.nav-links li {
  display: inline-block;
  padding: 10px;
}

.nav-links a {
  text-decoration: none;
  color: black;
  font-size: 18px;
}

.nav-links a:hover {
  /* color: crimson; */
  color: #556b2f;
  /* color: rgb(49, 3, 3); */
  /* color: white; */
  /* color: black; */
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

/* Profile tab */

.profile-tab {
  display: flex;
  align-items: center;
  gap: 5px;
}

/* Profile Tab Buttons */

.login-btn,
.signup-btn {
  border: none;
  color: white;
  border-radius: 42px;
  padding: 5px 3px;
  width: 80px;
  /* letter-spacing: 1px; */
  font-family: "Ubuntu Mono", monospace;
  font-size: 12px;
  height: 30px;
}

.login-btn {
  background-color: transparent;
  /* border: 1px solid #291477ff; */
  /* border: 1px solid rgb(49, 3, 3); */
  border: 1px solid #556b2f;
  color: black;
}

.signup-btn {
  /* background-color: #291477ff; */
  /* background: rgb(49, 3, 3); */
  background-color: #556b2f;
}

.profile-tab *:hover {
  cursor: pointer;
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

@media (max-width: 800px) {
  * {
    font-family: "Ubuntu Mono", monospace;
  }

  .nav-links li,
  .nav-links ul {
    padding: 0;
  }

  .nav {
    padding: 10px 4px;
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

  .nav-links li {
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

.nav-links .router-link-exact-active {
  /* color: crimson; */
  color: #556b2f;
  /* color: #f5f5dc; */
  /* font-weight: bold; */
  /* border: 1px dotted; */
  padding: 2px 10px;
  /* margin: 0; */
  border-radius: 14px;
  background-color: #556b2f;
  color: #f5f5f5;
}

.nav-links .router-link-exact-active:hover {
  color: white;
}
</style>
