<template >
  <div class="login">
    <div class="login_container">
      <h2>Login</h2>
      <form @submit.prevent="loginUser">
        
          <label for="username">Username:</label>
          <br>
          <input type="text" v-model="username" id="username" required />
        
  
        
          <label for="password">Password:</label>
          <br>
          <input type="password" v-model="password" id="password" required />
     
  
        <button type="submit">Login</button>
  
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
      password: "",
      errorMessage: "",
      successMessage: "",
    };
  },
  methods: {
    async loginUser() {
      try {
        const response = await axios.post(`${API_BASE_URL}/login`, {
          username: this.username,
          password: this.password,
        });

        this.successMessage = "Login successful!";
        this.errorMessage = "";

        localStorage.setItem("token", response.data.token);
        localStorage.setItem("username", this.username);
        localStorage.setItem("role", response.data.role);
        auth.login();
        this.username = "";
        this.password = "";
        this.$router.push("/");
      } catch (error) {
        this.errorMessage = error.response?.data?.message || "Login failed.";
        this.successMessage = "";
      }
    },
  },
};
</script>
  
<style scoped>
  .error {
    text-align: center;
    color: red;
    
  }
  .success {
    text-align: center;
    color: green;
  }
  .login{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: rgba(52, 52, 52, 0.395);
    }

  form{
    width: 80%;
  }
  .login_container{
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
  .login_container input{
    width: 100%;
    margin-bottom: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
  }
  .login_container button{
    width: 100%;
    background-color: #215249;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
    margin-bottom: 10px;
  }

</style>
