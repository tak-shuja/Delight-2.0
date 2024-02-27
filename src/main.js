import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
// import store from "./store";

// firebase imports
import { initializeApp } from "firebase/app";
import { GoogleAuthProvider, getAuth } from "firebase/auth";

// pinia imports
import { createPinia } from "pinia";

// Confirm Dialog imports
import PrimeVue from "primevue/config";
import ConfirmationService from "primevue/confirmationservice";
import ToastService from "primevue/toastservice";
import "primevue/resources/themes/nova-vue/theme.css";

// prime icons
import "primeicons/primeicons.css";

// Mosha dialog components
import moshaToast from "mosha-vue-toastify";
import "mosha-vue-toastify/dist/style.css";

// Css imports
import "../public/styles/index.css";
import "../public/styles/login-page.css";
import "../public/styles/style.css";
import "../public/styles/signup-style.css";
import "../public/styles/cart-style.css";

// pinia stuff
const pinia = createPinia();

// firebase stuff

const firebaseConfig = {
  apiKey: "AIzaSyBfBi2HGkGNqduMQwXzQ8QciVgyyxSiijw",
  authDomain: "rising-daylight-325319.firebaseapp.com",
  projectId: "rising-daylight-325319",
  storageBucket: "rising-daylight-325319.appspot.com",
  messagingSenderId: "700566060214",
  appId: "1:700566060214:web:2729822418e0164b68fa17",
};

// Initialize firebase
initializeApp(firebaseConfig);

// initialize firebase auth and google auth provider
const auth = getAuth();
const provider = new GoogleAuthProvider();

export { auth, provider };

createApp(App)
  .use(pinia)
  .use(router)
  .use(PrimeVue)
  .use(ConfirmationService)
  .use(ToastService)
  .use(moshaToast)
  .mount("#app");
