import { auth } from "@/main";
import {
  createUserWithEmailAndPassword,
  setPersistence,
  browserLocalPersistence,
  signInWithEmailAndPassword,
} from "firebase/auth";
import { defineStore } from "pinia";

export const authStore = defineStore("authStore", {
  state: () => ({
    user: null,
  }),
  actions: {
    // signup action
    async signup(email, password) {
      // get the response from the firebase api
      const res = await createUserWithEmailAndPassword(auth, email, password);

      // if the resp returns data, set tht user and  persistence in local storage else throw an error
      if (res) {
        this.user = res.user;

        // set the local storage persistence
        setPersistence(auth, browserLocalPersistence);
      } else {
        throw new error("Could not signup!");
      }
    },

    async signout() {
      await auth.signOut();
      this.user = false;
    },

    // LOGIN
    async login(email, password) {
      let res = await signInWithEmailAndPassword(auth, email, password);
      if (res) {
        this.user = res.user;
        this.isLoggedIn = true;
        // set the local storage persistence
        setPersistence(auth, browserLocalPersistence);
      } else {
        throw new error("Can not login!");
      }
    },



  },
});
