<template>
  <div class="banner">
    <img src="../imgs/laptop_586.webp" alt="" />
    <div>
      <h1>Upgrade Your Tech Today</h1>
      <h1>by taking care of the environment</h1>
      <p></p>
    </div>
  </div>

  <div class="site_description">
    <div class="site_description_text">
      <h1>Corporate IT Equipment Focused Version</h1>
      <p>
        GreenGizmos is your trusted source for high-quality refurbished
        corporate IT equipment. We help businesses save money and reduce e-waste
        by offering tested, reliable laptops, desktops, servers, and
        accessories—at a fraction of the original price. Whether you're
        upgrading your office tech or equipping a remote team, GreenGizmos
        delivers performance and sustainability in one smart package.
      </p>
    </div>
    <img src="../imgs/logo.webp" alt="" width="100px" height="100px" />
  </div>

  <section class="featured_products_section">
    <h1>Refurbished & Recommended products</h1>
    <hr
      style="
        border: none;
        height: 1px;
        background-color: #ccc;
        width: 100%;
        margin: 0;
      "
    />
    <div class="featured_products_container">
      <div class="featured_product">
        <img
          src="https://res.cloudinary.com/dvnylhnro/image/upload/v1745414395/dell-latitude-e5490-i5-8350u-1663567421_dfbeo7.jpg"
          alt=""
        />
        <h3>Dell Latitude</h3>
      </div>
      <div class="featured_product">
        <img
          src="https://res.cloudinary.com/dvnylhnro/image/upload/v1745414788/1549-intel-core-i7-14700kf-34-56ghz-box_bdy7ax.jpg"
          alt=""
        />
        <h3>Intel Core i7</h3>
      </div>
      <div class="featured_product">
        <img
          src="https://res.cloudinary.com/dvnylhnro/image/upload/v1745524558/71tduSp8ooL._AC_SX679__j1c7mn.jpg"
          alt=""
        />
        <h3>NVIDIA GeForce RTX 3060</h3>
      </div>
      <div class="featured_product">
        <img
          src="https://res.cloudinary.com/dvnylhnro/image/upload/v1745488633/shopping_ahy0b4.webp"
          alt=""
        />
        <h3>Logitech MX Master 3</h3>
      </div>
    </div>
  </section>
</template>

<script setup></script>

<style scoped>
.banner {
  display: flex;
  align-items: center;
  justify-content: center;
  background-image: url(../imgs/Home_background.webp);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  background-color: none;
  height: 520px;
  gap: 60px;
}
.banner > img {
  width: 400px;
  height: auto;
}
.users {
  display: flex;
  gap: 11px;
}
.site_description {
  display: flex;
  align-items: center;
  justify-content: space-evenly;
  gap: 20px;
  margin: 0px;
  padding: 10px;
  background-color: #215249;
}
.site_description > img {
  width: 20%;
  height: auto;
  background-color: white;
  border-radius: 50%;
}
.site_description_text {
  width: 60%;
  display: flex;
  flex-direction: column;
}
.site_description_text > h1 {
  width: 100%;
  color: white;
  margin: 10px 0 20px 0;
}
.site_description_text > p {
  color: white;
  width: 90%;
  line-height: 25px;
}

.featured_products_section {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  margin: 20px;
  padding: 10px;
  background-color: white;
}
.featured_products_container {
  display: flex;
  align-items: center;
  justify-content: center;

  gap: 10px;
}

.featured_product {
  width: 25%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background-color: #f3f3f5;
  border-radius: 10px;
}

.featured_product > img {
  width: 300px;
  height: 300px;
  padding: 20px;
}
.featured_product > h3 {
  width: 100%;
  text-align: center;
  margin: 0;
  padding: 10px;
  background-color: #215249;
  color: white;
  border-radius: 0 0 10px 10px;
}
</style>
