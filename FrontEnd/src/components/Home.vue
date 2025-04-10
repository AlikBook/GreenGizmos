<template>
  <nav class="Menu">
    <h2>Green Gizmos</h2>
    <a href="#">Computing Equipment</a>
    <a href="#">Components & Upgrades</a>
    <a href="#">Monitors & Displays</a>
    <a href="#">Peripherals</a>
    <a href="#">Printing & Scanning</a>
    <a href="#">Mobile Gear</a>
    <div class="users">
      <a href="#">Log in</a>
      <a href="#">Sign up</a>
    </div>
  </nav>

  <div class="banner">
    <div>
      <h1>Upgrade Your Tech Today</h1>
      <h1>by taking care of the environment</h1>
      <p></p>
    </div>
    <img src="../imgs/Laptop 1.webp" alt="" />
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
import Filters from "./Filters.vue";
import CategoryProducts from "./CategoryProducts.vue"; // Import du composant
</script>

<style scoped>
    .Menu{
        display: flex;
        gap: 10px;
        font-style: none;
        background-color: #588157;
        height: 80px;
        justify-content: space-between;
        align-items: center;
        text-align: center;
        padding: 0 20px 0 20px;
    }
    .Menu a{
        text-decoration: none;
        color: white;
    }
    .Menu>h2{
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        
    }
    .banner{
        display: flex;
        align-items: center;
        justify-content: center;
        
        gap: 35px;
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
