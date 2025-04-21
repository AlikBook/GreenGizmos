<template>
  <div class="cart">
    <h1>Your cart</h1>
    <div class="cart-items">
      <div class="cart-item" v-for="cart in cartitem">
        <div class="cart-item-image">
          <img :src="cart.image" alt="Product Image" />
        </div>
        <div class="cart-item-details">
          <h2>{{ cart.name }}</h2>
          <p>Price: {{ cart.price }}</p>
          <p>Quantity: {{ cart.quantity }}</p>
          <button @click="removeFromCart(cart.id)">Remove</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import axios from "axios";

const cartitem = ref([]);
const fetchCartItems = async () => {
  try {
    const response = await axios.get("http://localhost:3000/cart");
    cartitem.value = response.data;
  } catch (error) {
    console.error("Error fetching cart items:", error);
  }
};

onMounted(() => {
  fetchCartItems();
});
</script>

<style scoped>
.cart {
  margin: 100px 20px 20px 20px;
  border: 1px solid black;
  border-radius: 15px;
  padding: 20px;
}
</style>
