<template>
  <div class="add_product_page">
    <div class="add-product">
      <h1>Add a New Product</h1>
      <form @submit.prevent="addProduct">
        <div class="form-group">
          <label for="product_name">Product Name:</label>
          <input type="text" id="product_name" v-model="product_name" required />
        </div>
        <div class="form-group">
          <label for="product_price">Product Price:</label>
          <input type="number" id="product_price" v-model="product_price" required />
        </div>
        <div class="form-group">
          <label for="product_description">Product Description:</label>
          <textarea id="product_description" v-model="product_description" required></textarea>
        </div>
        <div class="form-group">
          <label for="category_name">Category:</label>
          <select id="category_name" v-model="category_name" required>
            <option v-for="category in categories" :key="category" :value="category">
              {{ category }}
            </option>
          </select>
        </div>
        <div class="form-group">
          <label for="img_url">Image URL:</label>
          <input type="url" id="img_url" v-model="img_url" required />
        </div>
        <button type="submit">Add Product</button>
      </form>
      <p v-if="message" class="success-message">{{ message }}</p>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";
import { API_BASE_URL } from "../config.js"; 

const product_name = ref("");
const product_price = ref("");
const product_description = ref("");
const category_name = ref("");
const img_url = ref("");
const categories = ref([]);
const message = ref("");

const fetchCategories = async () => {
  try {
    const response = await axios.get(`${API_BASE_URL}/categories`); 
    categories.value = response.data.map((category) => category.category_name);
  } catch (error) {
    console.error("Error fetching categories:", error);
  }
};

const addProduct = async () => {
  try {
    const response = await axios.post(`${API_BASE_URL}/add_product`, { 
      product_name: product_name.value,
      product_price: product_price.value,
      product_description: product_description.value,
      category_name: category_name.value,
      img_url: img_url.value,
    });
    message.value = response.data.message;

    product_name.value = "";
    product_price.value = "";
    product_description.value = "";
    category_name.value = "";
    img_url.value = "";
  } catch (error) {
    console.error("Error adding product:", error);
  }
};

onMounted(() => {
  fetchCategories();
});
</script>

<style scoped>
.add-product {
  max-width: 600px;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #f9f9f9;
  width: 100%;
  padding: 20px;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input,
textarea,
select {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

button {
  padding: 10px 20px;
  font-size: 16px;
  color: white;
  background-color: #215249;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #1a4038;
}

.success-message {
  margin-top: 15px;
  color: green;
  font-weight: bold;
}

.add_product_page {
  width: 100%;
  padding: 40px;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>