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
            <router-link :to="{ name: 'home' }">Home</router-link>
          </li>
          <li>
            <router-link :to="{ name: 'products' }">Products</router-link>
          </li>
          <!-- <li><router-link :to="{ name: 'product' }">PRODUCT</router-link></li> -->
          <li>
            <router-link :to="{ name: 'support' }">Support</router-link>
          </li>
          <span class="icon-label" onclick="alert('Work in progress')">
            <span
              class="material-symbols-outlined"
              id="shopping-cart-icon-resp"
            >
              shopping_cart
            </span>
            <span class="icon-text"> Shopping cart </span>
          </span>
        </ul>

        <div class="search-tab">
          <input
            type="search"
            name=""
            id=""
            class="search-bar"
            placeholder="search..."
          />
          <span class="material-symbols-outlined search-icon" title="search">
            search
          </span>
        </div>

        <div class="profile-tab">
          <span class="material-symbols-outlined" id="shopping-cart-icon">
            shopping_cart
          </span>
          <button class="login-btn">Login</button>
          <button class="signup-btn" @click="$router.push('/register')">
            Register
          </button>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  data() {
    return {
      display: "none",
      hidden: false,
    };
  },
  methods: {
    closeRespTab() {
      let navbar = document.getElementById("navbar-cont");

      navbar.style.display = navbar.style.display == "flex" ? "none" : "flex";
    },
    // const checkbox = document.getElementById("cbox");
    //   const close_tab = document.getElementById("close-resp-tab");
    check() {
      let navbar = document.getElementById("navbar-cont");

      navbar.style.display = navbar.style.direction == "flex" ? "none" : "flex";
    },
    redirectToRegisterPage() {
      this.$router.push({ name: "register" });
    },
  },
  computed: {
    homePage() {
      if (this.$route.path == "/register") {
        return false;
      } else {
        return true;
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
  padding: 12px 8px;
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
  color: crimson;
  /* color: rgb(49, 3, 3); */
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
  padding: 10px 12px;
  width: 100px;
  letter-spacing: 1px;
  font-family: "Ubuntu Mono", monospace;
  font-size: 12px;
}

.login-btn {
  background-color: transparent;
  /* border: 1px solid #291477ff; */
  border: 1px solid rgb(49, 3, 3);
  color: black;
}

.signup-btn {
  /* background-color: #291477ff; */
  background: rgb(49, 3, 3);
}

.profile-tab *:hover {
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
    height: 40px;
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
    font-size: 32px;
  }

  .icon-label:last-child {
    font-size: 20px;
  }

  #shopping-cart-icon {
    display: none;
  }
}

.nav-links .router-link-exact-active {
  color: crimson;
  font-weight: bold;
}
</style>
