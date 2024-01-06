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
            <form class="signup-page-container6" @submit.prevent="alertWIP">
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
              <button
                type="submit"
                class="signup-page-button button"
                id="submit-btn"
                :disabled="!submitDisabled"
              >
                SignUp
              </button>
              <a
                href="https://example.com"
                target="_blank"
                rel="noreferrer noopener"
                class="signup-page-link"
              >
                Alredy have an acoount? LOGIN
              </a>
              <div class="container4-container">
                <div class="container4-container1">
                  <svg viewBox="0 0 1024 1024" class="container4-icon">
                    <path
                      d="M522.2 438.8v175.6h290.4c-11.8 75.4-87.8 220.8-290.4 220.8-174.8 0-317.4-144.8-317.4-323.2s142.6-323.2 317.4-323.2c99.4 0 166 42.4 204 79l139-133.8c-89.2-83.6-204.8-134-343-134-283 0-512 229-512 512s229 512 512 512c295.4 0 491.6-207.8 491.6-500.2 0-33.6-3.6-59.2-8-84.8l-483.6-0.2z"
                    ></path>
                  </svg>
                </div>
                <div class="container4-container2">
                  <a
                    href="https://example.com"
                    target="_blank"
                    rel="noreferrer noopener"
                    class="container4-link"
                  >
                    <span>Sign up with Google</span>
                  </a>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
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
    alertWIP() {
      alert("Wirk In Progress");
    },

    logUserCreds() {
      const data = {
        username: this.email,
        password: this.password,
      };
      console.log(this.email, this.password);
      fetch("http://localhost:3000/public/server/create_user.php", {
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
  },
};
</script>
<style lang=""></style>
