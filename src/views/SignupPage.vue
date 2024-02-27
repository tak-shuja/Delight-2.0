<template>
  <div>
    <div>
      <!-- <link href="./signup-page.css" rel="stylesheet" /> -->

      <div class="signup-page-container">
        <div class="signup-page-container1">
          <div class="signup-page-container2">
            <div class="signup-page-container3">
              <img
                alt="image"
                src="assets/logo.png"
                class="signup-page-image"
              />
            </div>
            <div class="signup-page-container4">
              <span class="signup-page-text">
                <span>New on</span>
                <br />
                <span class="signup-page-text3">Delight</span>
                <span class="signup-page-text4">De</span>
                <span class="signup-page-text5">Heaven..?</span>
                <br class="signup-page-text6" />
                <span>Register here now</span>
                <br />
              </span>
            </div>
          </div>
          <div class="signup-page-container5">
            <form class="signup-page-container6" @submit.prevent="signUp">
              <label class="signup-page-label">Sign up</label>

              <input
                type="text"
                id="email_ID"
                required=""
                placeholder="E-mail ID"
                class="signup-page-textinput1 input"
                v-model="email"
              />
              <input
                type="password"
                id="Create Password"
                required=""
                placeholder="Create Password"
                class="signup-page-textinput2 input"
                v-model="password"
                @keyup="checkPasswordValidation"
              />
              <input
                type="password"
                id="Confirm Password"
                required=""
                placeholder="Confirm Password"
                class="signup-page-textinput3 input"
                v-model="confirmedPassword"
                @keyup="
                  if (validatePassword()) {
                    checkPasswords();
                  }
                "
              />
              <label>{{ validationText }}</label>
              <label>{{ loginResult }}</label>
              <button
                type="submit"
                class="signup-page-button button"
                id="submit-btn"
                :disabled="!submitDisabled"
              >
                SignUp
              </button>

              <span
                >Already have an acount?
                <router-link to="login" style="color: white"
                  >LOGIN</router-link
                ></span
              >
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { authStore } from "@/store";

export default {
  data() {
    return {
      store: authStore(),
      email: "",
      password: "",
      confirmedPassword: "",
      validationText: "",
      submitDisabled: true,
      validPasswordRegex: new RegExp(
        /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/
      ),
      wrongPasswordText:
        "Password must contain at least one uppercase character, one special character ",
    };
  },
  methods: {
    async signUp() {
      try {
        await this.store.signup(this.email, this.password);
        const data = this.store.user;
        await this.createUser(data);
        this.$router.push("/");
      } catch (err) {
        this.validationText = err;
      }
    },

    alertWIP() {
      alert("Work In Progress");
    },

    logUserCreds() {
      const data = {
        username: this.email,
        password: this.password,
      };
      console.log(this.email, this.password);
    },

    async createUser(data) {
      await fetch("http://localhost:3000/public/server/create_user.php", {
        body: JSON.stringify(data),
        method: "POST",
      })
        .then((resp) => resp.text())
        .then((data) => console.log(data))
        .catch((error) => console.error(error));
    },
    checkPasswordValidation() {
      if (!this.validPasswordRegex.test(this.password)) {
        this.validationText =
          "Password must contain: Uppercase character, one special character, a number and must be at least 8 characters long.";
        return true;
      } else {
        this.validationText = "";
        return false;
      }
    },

    checkPasswords() {
      if (this.password == this.confirmedPassword) {
        this.validationText = "";
      } else {
        this.validationText = "Passwords don't match";
      }
    },
    validatePassword() {
      return this.validPasswordRegex.test(this.password);
    },

    async login() {
      await this.store.login(this.email, this.password);
      this.$router.push("/");
    },
  },
};
</script>
<style lang=""></style>
