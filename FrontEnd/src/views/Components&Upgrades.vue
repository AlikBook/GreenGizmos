<template>
    <div>
      <CategoryProducts :categoryName="'Processors (CPUs)'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'RAM (Memory Modules)'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'Storage Devices'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'SSDs'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'HDDs'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'NVMe Drives'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'Graphic Cards (GPUs)'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'Motherboards'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'Power Supplies'" :addToCart="addToCart"/>
      <CategoryProducts :categoryName="'Cooling Fans / Heatsinks'" :addToCart="addToCart"/>
    </div>
  </template>
  
  <script setup>
import CategoryProducts from "../components/CategoryProducts.vue";
import axios from "axios";

const addToCart = async (product) => {
  try {
    const token = localStorage.getItem('token'); // Récupère le token depuis le localStorage
    const response = await axios.post(
      'http://localhost:3000/cart', // Route backend pour ajouter au panier
      {
        product_id: product.product_id,
        quantity: 1, // On ajoute une quantité de 1 par défaut
      },
      {
        headers: { Authorization: `Bearer ${token}` }, // Ajoute le token à l'en-tête de la requête
      }
    );
    alert(`${product.product_name} has been added to your cart!`); // Confirmation
  } catch (error) {
    console.error('Error adding product to cart:', error);
    alert('Failed to add product to cart.');
  }
};


</script>
  