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
    <div class="users">
      <router-link to="#">Log in</router-link>
      <router-link to="#">Sign up</router-link>
    </div>
    </nav>
</template>

<style scoped>
    .Menu{
        display: flex;
        gap: 10px;
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
</style>