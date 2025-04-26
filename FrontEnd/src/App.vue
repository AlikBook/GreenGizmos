<script setup>
import Menu from "./components/Menu.vue";
import Footer from "./components/Footer.vue";
import { SpeedInsights } from "@vercel/speed-insights/vue";
import { Analytics } from "@vercel/analytics/vue";
</script>

<template>
  <Menu></Menu>
  <div style="margin-top: 130px">
    <router-view></router-view>
    <SpeedInsights />
    <Analytics />
  </div>
  <Footer></Footer>
</template>
