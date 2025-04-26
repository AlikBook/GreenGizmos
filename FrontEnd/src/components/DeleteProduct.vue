<template>
  <div class="delete_product_page">
    <div class="delete-product">
      <h1>Delete a Product</h1>
      <form @submit.prevent="deleteProduct">
        <div class="form-group">
          <label for="product_name">Product Name:</label>
          <input
            type="text"
            id="product_name"
            v-model="product_name"
            required
          />
        </div>
        <button type="submit">Delete Product</button>
      </form>
      <p
        v-if="message"
        :class="{ 'success-message': success, 'error-message': !success }"
      >
        {{ message }}
      </p>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue";
import axios from "axios";
import { API_BASE_URL } from "../config.js";

const product_name = ref("");
const message = ref("");
const success = ref(false);

const deleteProduct = async () => {
  try {
    const token = localStorage.getItem("token");
    const response = await axios.delete(
      `${API_BASE_URL}/delete_product_by_name`,
      {
        headers: { Authorization: `Bearer ${token}` },
        data: { product_name: product_name.value },
      }
    );

    message.value = response.data.message;
    success.value = true;
    product_name.value = "";
  } catch (error) {
    console.error("Error deleting product:", error);
    message.value =
      error.response?.data?.message || "Failed to delete product.";
    success.value = false;
  }
};
</script>

<style scoped>
.delete-product {
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

input {
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

.error-message {
  margin-top: 15px;
  color: red;
  font-weight: bold;
}

.delete_product_page {
  width: 100%;
  padding: 40px;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
