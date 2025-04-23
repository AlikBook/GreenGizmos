<template>
  <h1>All of our products</h1>
  <div>
    <ul v-if="data.length > 0">
      <li v-for="item in data" :key="item.id">
        <h2>{{ item.product_name }}</h2>
        <p>{{ item.product_description }}</p>
        <p>Price: {{ item.product_price }}</p>
        <p>ID: {{ item.product_id }}</p>
        <button @click="addToCart(item)">Add to Cart</button>
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

const addToCart = async (product) => {
  try {
    const token = localStorage.getItem("token");
    await axios.post(
      "http://localhost:3000/cart",
      {
        product_id: product.product_id,
        quantity: 1,
      },
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );
    alert(`${product.product_name} has been added to your cart!`);
  } catch (error) {
    console.error("Error adding product to cart:", error);
    alert("Failed to add product to cart.");
  }
};

onMounted(() => {
  fetchData();
});
</script>

<style scoped></style>