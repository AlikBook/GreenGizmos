<template>
  <div class="cart">
    <h1>Your cart</h1>
    <div class="cart-items">
      <div class="cart-item" v-for="cart in cartitem">
        <h2>Cart ID: {{ cart.cart_id }}</h2>
        <p>Product ID: {{ cart.product_id || "N/A" }}</p>
        <p>Quantity: {{ cart.quantity }}</p>
        <p>Status: {{ cart.status }}</p>
        <p>Added At: {{ new Date(cart.added_at).toLocaleString() }}</p>
        <button @click="removeFromCart(cart.cart_id)">Remove</button>
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
    const token = localStorage.getItem("token");
    const response = await axios.get("http://localhost:3000/cart", {
      headers: { Authorization: `Bearer ${token}` },
    });
    cartitem.value = response.data;
    console.log(response.data);
  } catch (error) {
    console.error("Error fetching cart items:", error);
  }
};

const removeFromCart = async (cartId) => {
  try {
    const token = localStorage.getItem("token");
    await axios.delete(`http://localhost:3000/cart`, {
      headers: { Authorization: `Bearer ${token}` },
      data: { product_id: cartId },
    });
    cartitem.value = cartitem.value.filter((item) => item.cart_id !== cartId);
    alert("Item removed from cart successfully!");
  } catch (error) {
    console.error("Error removing item from cart:", error);
    alert("Failed to remove item from cart.");
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

.cart-items {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.cart-item {
  border: 1px solid #ccc;
  border-radius: 10px;
  padding: 10px;
}

.cart-item button {
  background-color: #ff4d4d;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 5px 10px;
  cursor: pointer;
}
</style>
