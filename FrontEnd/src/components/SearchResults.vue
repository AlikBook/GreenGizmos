<template>
  <div class="search-results">
    <h1>Search Results for "{{ searchTerm }}"</h1>
    <ul v-if="results.length > 0">
      <li v-for="product in results" :key="product.product_id">
        <h3>{{ product.product_name }}</h3>
        <p>{{ product.product_description }}</p>
        <p>Price: ${{ product.product_price }}</p>
      </li>
    </ul>
    <p v-else>No products found.</p>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";

const route = useRoute();
const searchTerm = ref(route.query.q || ""); 
const results = ref([]); 

const fetchResults = async () => {
  try {
    const response = await axios.get(
      `http://localhost:3000/search_products?q=${searchTerm.value}`
    );
    results.value = response.data;
  } catch (error) {
    console.error("Error fetching search results:", error);
  }
};

watch(
  () => route.query.q,
  (newQuery) => {
    searchTerm.value = newQuery || "";
    fetchResults();
  }
);

fetchResults();
</script>

<style scoped>
.search-results {
  margin: 20px;
}

.search-results h1 {
  margin-bottom: 20px;
}

.search-results ul {
  list-style: none;
  padding: 0;
}

.search-results li {
  margin-bottom: 15px;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}
</style>