<template>
  <div class="search-bar">
    <form @submit.prevent="onSearch">
      <input
        type="text"
        v-model="searchTerm"
        placeholder="Search for products..."
      />
      <button type="submit">Search</button>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";

const searchTerm = ref(""); 
const router = useRouter(); 

const onSearch = () => {
  if (searchTerm.value.trim() !== "") {
    router.push({ path: "/search-results", query: { q: searchTerm.value } });
  }
};
</script>

<style scoped>
.search-bar {
  width: 70%;
  display: flex;
  justify-content: center; 
  align-items: center;
}

.search-bar form {
  display: flex;
  gap: 10px; 
  max-width: 600px;
  width: 100%;
}

.search-bar input {
  flex: 1; 
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.search-bar button {
  padding: 10px 20px;
  font-size: 16px;
  color: white;
  background-color: #215249;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

</style>