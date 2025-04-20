<template>
    <nav class="Menu">
    <router-link to="/" class="logo-link">
    <div class="logo">
        <img src="../imgs/logo.png" alt="" width="40px" height="40px"/>
        <h2>Green Gizmos</h2>
    </div>
    </router-link>
    <router-link to="/computing-equipment">Computing Equipment</router-link>
    <router-link to="/components-upgrades">Components & Upgrades</router-link>
    <router-link to="/monitors-displays">Monitors & Displays</router-link>
    <router-link to="/peripherals">Peripherals</router-link>
    <router-link to="/printing-scanning">Printing & Scanning</router-link>
    <router-link to="/mobile-gear">Mobile Gear</router-link>
    <router-link to="/cart">
        <div>
            <font-awesome-icon :icon="['fas', 'cart-shopping']" />
            <p>0</p>
        </div>
    </router-link>
    <router-link to="/add-product">Add Product</router-link>
    <div class="users">
    <template v-if="isLoggedIn">
        <p>Welcome !</p>
        <p>{{ username }}</p>
        <button @click="logout">Logout</button>
    </template>
    <template v-else>
        <router-link to="/log-in">Log in</router-link>
        <router-link to="/sign-up">Sign up</router-link>
    </template>
    </div>

    <SearchBar />
    </nav>
</template>


<script>
import { ref, onMounted } from "vue";
import { auth } from "../auth.js";
import SearchBar from "./SearchBar.vue"; 
export default {
  setup() {
    const isLoggedIn = ref(!!localStorage.getItem("token"));
    const username = ref(localStorage.getItem("username") || "");

    const logout = () => {
      localStorage.removeItem("token");
      localStorage.removeItem("username");
      auth.logout(); // notify listeners
    };

    onMounted(() => {
      auth.emitter.on("auth-change", (status) => {
        isLoggedIn.value = status;
        username.value = localStorage.getItem("username") || "";
      });
    });

    return { isLoggedIn, username, logout };
  },
  components: {
    SearchBar,
  },
};
</script>



<style scoped>
    .Menu{
        display: flex;
        
        font-style: none;
        background-color: #215249;
        height: 80px;
        justify-content: space-between;
        align-items: center;
        text-align: center;
        padding: 0 20px 0 20px;

        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000;
        
    }
    .Menu a{
        text-decoration: none;
        font-size: 15px;
        color: white;
    }
    .Menu>h2{
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        
    }
    .logo{
        
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }
    .logo>img{
        background-color: white;
        border-radius: 100%;
    }

    .users{
        display: flex;
        gap: 5px;
        flex-direction: column;
    }

    .users>p{
        color: white;
        font-size: 15px;
    }
    .users >button{
        background-color: white;
        color: #215249;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
    }
</style>