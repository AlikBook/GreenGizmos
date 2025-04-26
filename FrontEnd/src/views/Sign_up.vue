<template>
  <div class="signup">
    <div class="signup_container">
      <h2>Register</h2>
      <form @submit.prevent="registerUser">
        <label for="username">Username:</label>
        <input type="text" v-model="username" id="username" required />

        <label for="email">Email:</label>
        <input type="email" v-model="email" id="email" required />

        <label for="password">Password:</label>
        <input type="password" v-model="password" id="password" required />

        <button type="submit">Register</button>

        <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
        <p v-if="successMessage" class="success">{{ successMessage }}</p>
      </form>
    </div>
  </div>
</template>
  
<script>
import axios from "axios";
import { auth } from "../auth.js";
import { API_BASE_URL } from "../config.js"; 

export default {
  data() {
    return {
      username: "",
      email: "",
      password: "",
      errorMessage: "",
      successMessage: "",
    };
  },
  methods: {
    async registerUser() {
      try {
        const registerResponse = await axios.post(`${API_BASE_URL}/register`, {
          username: this.username,
          email: this.email,
          password: this.password,
        });

        this.successMessage = registerResponse.data.message;
        this.errorMessage = "";

        const loginResponse = await axios.post(`${API_BASE_URL}/login`, { 
          username: this.username,
          password: this.password,
        });

        localStorage.setItem("token", loginResponse.data.token);
        localStorage.setItem("username", this.username);
        auth.login();

        this.$router.push("/");
        this.username = "";
        this.email = "";
        this.password = "";
      } catch (error) {
        this.errorMessage = error.response?.data?.message || "An error occurred.";
        this.successMessage = "";
      }
    },
  },
};
</script>

  
<style scoped>
.signup {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(52, 52, 52, 0.395);
}
.signup_container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 300px;
  width: 300px;
  background-color: white;
  margin: 20px;
  border-radius: 10px;
  gap: 10px;
}
.signup_container input {
  width: 100%;
  margin-bottom: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
}
.signup_container button {
  width: 100%;
  background-color: #215249;
  color: white;
  border: none;
  padding: 10px;
  border-radius: 5px;
  cursor: pointer;
  margin-bottom: 10px;
}

form{
    width: 80%;
  }
.error {
  text-align: center;
  color: red;
}
.success {
  text-align: center;
  color: green;
}
</style>