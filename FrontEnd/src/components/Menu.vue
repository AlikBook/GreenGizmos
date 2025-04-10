<template>
    <nav class="Menu">
    <router-link to="/" class="logo-link">
        <h2>Green Gizmos</h2>
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
        background-color: #598B71;
        height: 80px;
        justify-content: space-between;
        align-items: center;
        text-align: center;
        padding: 0 20px 0 20px;
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
</style>