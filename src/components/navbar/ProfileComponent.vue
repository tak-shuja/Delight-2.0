<template>
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
      <button class="login-btn" @click="$router.push('/login')">Login</button>
      <button class="signup-btn" @click="$router.push('/register')">
        Register
      </button>
    </span>
    <span v-else>
      <div style="display: flex; flex-direction: column">
        <div class="material-symbols-outlined" @click="showProfileTab">
          account_circle
        </div>

        <div class="account-tab" :style="{ display: showProfile }">
          <div>Signed in as</div>
          <div>{{ userEmail }}</div>
          <div>
            <button @click="signout" class="btn-signout">
              Log out
              <span class="material-symbols-outlined icn-logout">logout</span>
            </button>
          </div>
        </div>
      </div>
    </span>
  </div>
</template>

<script>
import { authStore } from "@/store";

export default {
  props: { isLoggedIn: Boolean, userEmail: String },
  data() {
    return {
      showProfile: "none",
      authStore: authStore(),
    };
  },

  methods: {
    showProfileTab() {
      this.showProfile = this.showProfile == "none" ? "flex" : "none";
    },

    signout() {
      this.authStore.signout();
      if (this.$route.path != "/") this.$router.push("/home");
      this.showProfileTab();
    },
  },
};
</script>

<style scoped>
/* Profile tab */

.profile-tab {
  display: flex;
  align-items: center;
  gap: 5px;
  cursor: pointer;
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
  background: rgba(0, 0, 0, 0.5);
  color: #ded;
  top: 6.7rem;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
}

/* Profile Tab Buttons */

.login-btn,
.signup-btn {
  border: none;
  color: white;
  border-radius: 42px;
  padding: 5px 3px;
  width: 80px;
  font-family: "Ubuntu Mono", monospace;
  font-size: 12px;
  height: 30px;
}

.login-btn {
  background-color: transparent;
  border: 1px solid #556b2f;
  color: black;
}

.signup-btn {
  background-color: #556b2f;
}

.icn-logout {
  font-size: 18px;
  margin: 2px;
}
.btn-signout {
  border: none;
  border-radius: 8px;
  color: white;
  background-color: rgb(210, 0, 0);
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
  align-items: center;
  font-size: 18px;
  width: 100px;
  padding: 4px 8px;
  cursor: pointer;
}

.btn-signout:hover {
  background-color: rgb(230, 0, 0);
}
</style>
