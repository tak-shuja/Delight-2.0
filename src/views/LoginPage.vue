<template>
  <div>
    <div>
      <!-- <link href="./signup-page.css" rel="stylesheet" /> -->

      <div class="login-page-container">
        <div class="login-page-container1">
          <div class="login-page-container2">
            <div class="login-page-container3">
              <img alt="image" src="assets/logo.png" class="login-page-image" />
            </div>
            <div class="login-page-container4">
              <span class="login-page-text">
                <span>Welcome to</span>
                <br class="login-page-text2" />
                <span class="login-page-text3">Delight</span>
                <span class="login-page-text4">De</span>
                <span class="login-page-text5">Heaven</span>
                <span>
                  , your one-stop destination for premium dry fruits, and nuts.
                </span>
              </span>
            </div>
          </div>
          <div class="login-page-container5">
            <div class="login-page-container6">
              <label class="login-page-label">LOGIN</label>
              <input
                type="text"
                id="user_Name"
                required=""
                placeholder="User Name"
                class="login-page-textinput input"
                v-model="email"
              />
              <span style="display: inline-flex">
                <input
                  :type="passwordVisible"
                  id="Password"
                  required=""
                  placeholder="Password"
                  class="login-page-textinput1 input"
                  v-model="password"
                  title="Toggle Password Visibility"
                />
                <span
                  class="fa fa-eye-slash eye-slash"
                  @click="togglePasswordVisibility"
                  :style="visibilitySwitchStyle"
                ></span>
              </span>
              <span
                href="https://example.com"
                target="_blank"
                rel="noreferrer noopener"
                class="login-page-link"
                onclick="alert('Work In Progress')"
              >
                Forgot password..?
              </span>
              <button
                type="button"
                class="login-page-button button"
                @click="login"
              >
                LOGIN
              </button>
              <a
                href="https://example.com"
                target="_blank"
                rel="noreferrer noopener"
                class="login-page-link1"
              >
                Create New Account
              </a>
              <div class="container5-container">
                <div class="container5-container1">
                  <svg viewBox="0 0 1024 1024" class="container5-icon">
                    <path
                      d="M522.2 438.8v175.6h290.4c-11.8 75.4-87.8 220.8-290.4 220.8-174.8 0-317.4-144.8-317.4-323.2s142.6-323.2 317.4-323.2c99.4 0 166 42.4 204 79l139-133.8c-89.2-83.6-204.8-134-343-134-283 0-512 229-512 512s229 512 512 512c295.4 0 491.6-207.8 491.6-500.2 0-33.6-3.6-59.2-8-84.8l-483.6-0.2z"
                    ></path>
                  </svg>
                </div>
                <div class="container5-container2">
                  <a
                    href="https://example.com"
                    target="_blank"
                    rel="noreferrer noopener"
                    class="container5-link"
                  >
                    <span>Sign up with Google</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
.eye-slash {
  /* position: absolute;
  right: 10px;
  border: 1px solid red;
  bottom: 50px; */
  margin-left: -30px;
  margin-top: 8px;
  font-size: 20px;
  cursor: pointer;
}
</style>

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
      passwordVisible: "password",

      visibilitySwitchStyle: "color: #2c3e50;",
    };
  },

  methods: {
    togglePasswordVisibility() {
      this.passwordVisible =
        this.passwordVisible === "password" ? "text" : "password";

      if (this.passwordVisible === "password") {
        this.passwordVisible === "text";
        this.visibilitySwitchStyle = "color: #2c3e50";
      } else {
        this.passwordVisible === "password";
        this.visibilitySwitchStyle = "color: white";
      }
      // alert(this.passwordVisible == "text");
      // alert(this.passwordVisible);
    },

    async login() {
      await this.authStore.login(this.email, this.password);
      this.$router.push("/");
    },

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
