<template>
  <div class="category-products">
    <h2 class="category-title">{{ categoryName }}</h2>
    <ul v-if="products.length > 0" class="products-grid">
      <li v-for="product in products" :key="product.product_id" class="product-card">
        
        <img :src="product.img_url" loading="lazy" :alt="product.product_name" class="product-image" />
         
        <div class="product-content">
          <h3 class="product-name">{{ product.product_name }}</h3>
          <p class="product-description">{{ product.product_description }}</p>
        </div>
        <div class="product-footer">
          <span class="product-price">${{ product.product_price }}</span>
          <button
            v-if="addToCart"
            class="add-to-cart-button"
            @click="addToCart(product)"
          >
             Add to Cart
          </button>
        </div>
      </li>
    </ul>
    <p v-else class="no-products">No products found for this category.</p>
  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import axios from "axios";

const { categoryName, addToCart } = defineProps({
  categoryName: {
    type: String,
    required: true,
  },
  addToCart: {
    type: Function,
    required: false,
  },
});

const products = ref([]);

const fetchProductsByCategory = async () => {
  try {
    const response = await axios.get(
      `http://localhost:3000/products_by_category?category=${encodeURIComponent(categoryName)}`
    );
    products.value = response.data;
  } catch (error) {
    console.error("Error fetching products:", error);
  }
};

watch(() => categoryName, fetchProductsByCategory, { immediate: true });
</script>

<style scoped>
.category-products {
  margin: 50px auto;
  max-width: 1200px;
  padding: 0 25px;
}

.category-title {
  font-size: 2.2rem;
  font-weight: 700;
  color: #1a202c;
  margin-bottom: 1.5rem;
  border-bottom: 3px solid #e2e8f0;
  padding-bottom: 10px;
  text-transform: capitalize;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 24px;
  list-style: none;
  padding: 0;
  margin: 0;
}

.product-card {
  background: #ffffff;
  border: 1px solid #e5e7eb;
  border-radius: 16px;
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  transition: all 0.3s ease-in-out;
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.04);
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08);
}

.product-content {
  flex-grow: 1;
}

.product-name {
  font-size: 1.25rem;
  font-weight: 600;
  color: #2d3748;
  margin-bottom: 0.4rem;
}

.product-description {
  font-size: 0.95rem;
  color: #718096;
  line-height: 1.4;
  margin-bottom: 1.2rem;
}

.product-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.product-price {
  background: #38a169;
  color: #fff;
  padding: 6px 12px;
  font-size: 0.95rem;
  border-radius: 20px;
  font-weight: 600;
  white-space: nowrap;
}

.no-products {
  color: #999;
  font-style: italic;
  margin-top: 10px;
  font-size: 1rem;
}

.add-to-cart-button {
  background-color: #3182ce; /* bleu élégant */
  color: white;
  padding: 10px 18px;
  border: none;
  border-radius: 9999px;
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
  box-shadow: 0 4px 12px rgba(49, 130, 206, 0.25);
}

.add-to-cart-button:hover {
  background-color: #2b6cb0;
  transform: translateY(-1px);
}

.add-to-cart-button:active {
  background-color: #2c5282;
  transform: translateY(0);
}
.product-image {
  width: 100%;
  max-width: 300px;
  height: 200px;
  object-fit: contain;
  border-radius: 10px;
  margin-bottom: 10px;
  background-color: #f9f9f9; /* pour éviter les zones transparentes moches */
}

</style>

