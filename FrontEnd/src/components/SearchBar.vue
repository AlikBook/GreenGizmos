<template>
  <div class="search-bar">
    <input
      type="text"
      v-model="searchTerm"
      placeholder="Search for products..."
      @input="onSearch"
    />
    <div class="results-container">
      <ul v-if="results.length > 0" class="results-list">
        <li v-for="product in results" :key="product.product_id">
          <h3>{{ product.product_name }}</h3>
          <p>{{ product.product_description }}</p>
          <p>Price: ${{ product.product_price }}</p>
        </li>
      </ul>
      <p v-else-if="searchTerm && results.length === 0">No products found.</p>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import axios from "axios";

const searchTerm = ref(""); 
const results = ref([]); 

const onSearch = async () => {
  if (searchTerm.value.trim() === "") {
    results.value = []; 
    return;
  }

  try {
    const response = await axios.get(
      `http://localhost:3000/search_products?q=${searchTerm.value}`
    );
    results.value = response.data; 
  } catch (error) {
    console.error("Error searching products:", error);
  }
};
</script>

<style scoped>
.search-bar {
  margin: 20px 0;
  position: relative; 
}

.search-bar input {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.results-container {
  max-height: 300px; 
  overflow-y: auto; 
  margin-top: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff; 
  position: absolute; 
  width: 100%; 
  z-index: 10; 
}

.results-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.results-list li {
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

.results-list li:last-child {
  border-bottom: none; 
}
</style>