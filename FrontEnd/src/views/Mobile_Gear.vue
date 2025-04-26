<template>
    <div>
      <CategoryProducts :categoryName="'Tablets'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'Mobile Phones'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'Laptop Bags / Cases'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'Portable Chargers / Power Banks'" :addToCart="addToCart"/>
    </div>
  </template>
  
  <script setup>
import CategoryProducts from "../components/CategoryProducts.vue";
import axios from "axios";
import { API_BASE_URL } from "../config.js"; 

const addToCart = async (product) => {
  try {
    const token = localStorage.getItem("token");
    const response = await axios.post(
      `${API_BASE_URL}/cart`,
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
</script>
