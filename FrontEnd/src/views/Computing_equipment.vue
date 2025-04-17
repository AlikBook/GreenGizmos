<template>

    
<div class="product-card">
      <img
        src="https://via.placeholder.com/300x180?text=Dell+Latitude"
        alt="Dell Latitude Laptop"
      />
      <div class="info">
        <h3>Dell Latitude</h3>
        <p>Business-grade laptop with Intel i7 CPU and SSD storage.</p>
      </div>
    </div>

    <div class="product-card">
      <img
        src="https://via.placeholder.com/300x180?text=HP+Z+Workstation"
        alt="HP Z Workstation"
      />
      <div class="info">
        <h3>HP Z Workstation</h3>
        <p>High-performance workstation for professionals.</p>
      </div>
    </div>
<Filters />

<!-- Nouvelle section pour afficher les produits d'une catégorie -->
<div class="section-title">🛒 Products in Computing Equipment</div>
<section class="category-section">
  <CategoryProducts :categoryName="'Computing Equipment'" />
</section>

<div class="section-title">🛒 Products in Monitors & Displays</div>
<section class="category-section">
  <CategoryProducts :categoryName="'Keyboards (wired/wireless)'" />
</section>

<CategoryProducts :categoryName="'Computing Equipment'" />
</template>

<script setup>
import Filters from "../components/Filters.vue"; 
import CategoryProducts from "../components/CategoryProducts.vue";

</script>