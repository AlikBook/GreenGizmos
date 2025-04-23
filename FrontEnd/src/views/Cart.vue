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
  max-width: 1000px;
  margin: 100px auto;
  padding: 30px;
  border-radius: 16px;
  background-color: #f9fafb;
  box-shadow: 0 6px 24px rgba(0, 0, 0, 0.06);
}

.cart h1 {
  font-size: 2rem;
  font-weight: 700;
  color: #2d3748;
  margin-bottom: 30px;
  border-bottom: 2px solid #e2e8f0;
  padding-bottom: 10px;
}

.cart-items {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.cart-item {
  background: white;
  border: 1px solid #e5e7eb;
  border-radius: 16px;
  padding: 20px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
}

.cart-item h2 {
  font-size: 1.1rem;
  font-weight: 600;
  color: #2d3748;
  margin-bottom: 10px;
}

.cart-item p {
  font-size: 0.95rem;
  color: #4a5568;
  margin: 4px 0;
}

.cart-item button {
  background-color: #e53e3e;
  color: white;
  padding: 8px 16px;
  border: none;
  border-radius: 9999px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.3s ease;
  margin-top: 10px;
}

.cart-item button:hover {
  background-color: #c53030;
}
</style>
