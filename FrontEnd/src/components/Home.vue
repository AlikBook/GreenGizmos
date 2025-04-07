<template>
  <nav class="Menu">
    <h2>Green Gizmos</h2>
    <a href="#">Computing Equipment</a>
    <a href="#">Components & Upgrades</a>
    <a href="#">Monitors & Displays</a>
    <a href="#">Peripherals</a>
    <a href="#">Printing & Scanning</a>
    <a href="#">Mobile Gear</a>
  </nav>

  <div class="banner">
    <div><h1>Upgrade Your Tech Today</h1></div>
    <img src="" alt="">
  </div>

  <div class="section-title">🔥 Featured Products</div>
  <section class="featured-products">
    <div class="product-card">
      <img src="https://via.placeholder.com/300x180?text=Dell+Latitude" alt="Dell Latitude Laptop">
      <div class="info">
        <h3>Dell Latitude</h3>
        <p>Business-grade laptop with Intel i7 CPU and SSD storage.</p>
      </div>
    </div>

    <div class="product-card">
      <img src="https://via.placeholder.com/300x180?text=HP+Z+Workstation" alt="HP Z Workstation">
      <div class="info">
        <h3>HP Z Workstation</h3>
        <p>High-performance workstation for professionals.</p>
      </div>
    </div>

    <div class="product-card">
      <img src="https://via.placeholder.com/300x180?text=Samsung+Monitor" alt="Samsung Monitor">
      <div class="info">
        <h3>Samsung LED Monitor</h3>
        <p>24” full HD LED monitor with vivid colors.</p>
      </div>
    </div>

    <div class="product-card">
      <img src="https://via.placeholder.com/300x180?text=Logitech+Keyboard" alt="Logitech Keyboard">
      <div class="info">
        <h3>Logitech Wireless Keyboard</h3>
        <p>Sleek, responsive, and built for productivity.</p>
      </div>
    </div>
  </section>
</template>

<style scoped>
    .Menu{
        display: flex;
        gap: 10px;
        font-style: none;
        background-color: #588157;
        height: 70px;
        justify-content: center;
        align-items: center;
        text-align: center;
        padding: 10px;
        
    }
    .Menu>a{
        text-decoration: none;
        color: white;
    }
    .Menu>h2{
        color: white;
    }
</style>