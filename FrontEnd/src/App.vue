<script setup>
import Menu from './components/Menu.vue';
import Footer from './components/Footer.vue';

</script>

<template>
  <Menu></Menu>
  <div style="margin-top: 80px;">
    <router-view></router-view>
  </div>
  <Footer></Footer>
  
</template>
