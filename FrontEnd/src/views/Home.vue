<template>
  
  <div class="banner">
    <img src="../imgs/laptop_586.webp" alt="" />
    <div>
      <h1>Upgrade Your Tech Today</h1>
      <h1>by taking care of the environment</h1>
      <p></p>
    </div>
    
  </div>

  <div class="section-title">🔥 Featured Products</div>
  <section class="featured-products">
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
  </section>

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

<style scoped>
    .banner{
        display: flex;
        align-items: center;
        justify-content: center;
        background-image: url(../imgs/Home_background.webp);
        background-size:cover; /* Reduces the size of the background image */
        background-position: center; /* Centers the background image */
        background-color: none;
        height: 520px;
        gap: 60px;
    }
    .banner>img{
        width: 400px;
        height: auto;
    }
    .users{
      display: flex;
      gap: 11px;
    }
</style>
