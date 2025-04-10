<template>
  <div class="category-products">
    <h2>Products in {{ categoryName }}</h2>
    <ul v-if="products.length > 0">
      <li v-for="product in products" :key="product.product_id" class="product-item">
        <h3>{{ product.product_name }}</h3>
        <p>{{ product.product_description }}</p>
        <p>Price: ${{ product.product_price }}</p>
      </li>
    </ul>
    <p v-else>No products found for this category.</p>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import axios from "axios";

// Recevoir la catégorie en prop
const props = defineProps({
  categoryName: {
    type: String, // Type attendu
    required: true, // Rend la prop obligatoire
  },
});

const products = ref([]);

// Fonction pour récupérer les produits par catégorie
const fetchProductsByCategory = async () => {
  try {
    const response = await axios.get(
      `http://localhost:3000/products_by_category?category=${props.categoryName}`
    );
    products.value = response.data;
  } catch (error) {
    console.error("Error fetching products:", error);
  }
};

// Surveiller les changements de la catégorie et mettre à jour les produits
watch(() => props.categoryName, fetchProductsByCategory, { immediate: true });
</script>

<style scoped>
.category-products {
  margin-top: 20px;
}
.product-item {
  margin-bottom: 15px;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}
</style>