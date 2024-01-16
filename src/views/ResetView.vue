<template>
  <p>
    <input
      type="email"
      name=""
      id=""
      placeholder="enter an email"
      v-model="email"
    />
    <button @click="changePassword">Change Password</button>
  </p>
</template>

<script>
import { auth } from "@/main";
import { sendPasswordResetEmail } from "firebase/auth";
export default {
  data() {
    return {
      email: "",
    };
  },
  methods: {
    async changePassword() {
      await sendPasswordResetEmail(auth, this.email);
    },
  },
};
</script>
