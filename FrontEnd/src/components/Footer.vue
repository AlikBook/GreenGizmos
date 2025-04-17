<template>
<div class="site-footer">
  <div class="footer-container">
    
    <div class="footer-about">
      <h3>About GreenGizmos</h3>
      <p>We specialize in refurbished corporate IT equipment—helping you upgrade sustainably while cutting costs. From laptops to peripherals, we've got your tech needs covered.</p>
    </div>

    <div class="footer-social">
      <h3>Follow Us</h3>
      <div class="social-icons">
        <a href="#">Facebook</a>
        <a href="#">Instagram</a>
        <a href="#">LinkedIn</a>
      </div>
    </div>

  </div>

  <div class="footer-bottom">
    <p>© 2025 GreenGizmos. All rights reserved.</p>
  </div>

</div>
</template>

<style scoped>
.site-footer {
  background-color: #215249;
  color: white;
  padding: 40px 20px 20px;
  font-size: 14px;
  
}

.footer-container {
  display: flex;
  
  justify-content: space-evenly;
}

.footer-container h3 {
  margin-bottom: 10px;
  font-size: 16px;
}


.footer-container ul {
  list-style: none;
  padding: 0;
}

.footer-container li, .footer-container a {
  color: white;
  text-decoration: none;
  margin-bottom: 6px;
  display: block;
}

.footer-container a:hover {
  text-decoration: underline;
}

.footer-social .social-icons a img {
  width: 24px;
  height: 24px;
  margin-right: 10px;
}

.footer-bottom {
  text-align: center;
  border-top: 1px solid #ffffff33;
  margin-top: 20px;
  padding-top: 15px;
  font-size: 12px;
}

.footer-about{
    width: 50%;
}

</style>