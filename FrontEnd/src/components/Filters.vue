<template>
  <h1>All of our products</h1>
  <div>
    <ul v-if="data.length > 0">
      <li v-for="item in data" :key="item.id">
        <h2>{{ item.product_name }}</h2>
        <p>{{ item.product_description }}</p>
        <p>Price: {{ item.product_price }}</p>
        <p>ID: {{ item.product_id }}</p>
      </li>
    </ul>
    <p v-else>No products available</p>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";

const data = ref([]);
const fetchData = async () => {
  try {
    const response = await axios.get("http://localhost:3000/products");
    data.value = response.data;
  } catch (error) {
    console.error("Error fetching data:", error);
  }
};

onMounted(() => {
  fetchData();
});
</script>

<style scoped></style>
