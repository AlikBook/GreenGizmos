<template>
    <div class="user-manager">
      <h2>User Management</h2>
      <table>
        <thead>
          <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Role</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in users" :key="user.user_id">
            <td><input v-model="user.username" /></td>
            <td><input v-model="user.email" /></td>
            <td>
                <select v-model="user.role">
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                    <option value="guest">Guest</option>
                </select>
            </td>
            <td>
              <button @click="updateUser(user)">Save</button>
              <button @click="deleteUser(user.user_id)">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
      <p v-if="message">{{ message }}</p>
    </div>
  </template>
  
  <script>
  import axios from "axios";
  
  export default {
    data() {
      return {
        users: [],
        message: "",
      };
    },
    async created() {
      try {
        const token = localStorage.getItem("token");
        const response = await axios.get("http://localhost:3000/users", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        this.users = response.data;
      } catch (error) {
        this.message = error.response?.data?.message || "Failed to fetch users.";
      }
    },
    methods: {
      async updateUser(user) {
        try {
          const token = localStorage.getItem("token");
          await axios.put(`http://localhost:3000/users/${user.user_id}`, user, {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
          this.message = "User updated successfully.";
        } catch (error) {
          this.message = error.response?.data?.message || "Failed to update user.";
        }
      },
      async deleteUser(userId) {
        try {
          const token = localStorage.getItem("token");
          await axios.delete(`http://localhost:3000/users/${userId}`, {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
          this.users = this.users.filter(u => u.user_id !== userId);
          this.message = "User deleted successfully.";
        } catch (error) {
          this.message = error.response?.data?.message || "Failed to delete user.";
        }
      },
    },
  };
  </script>
  
  <style scoped>
  .user-manager {
    padding: 20px;
    min-height: 300px;
  }
  .user-manager h2 {
    margin-bottom: 20px;
  }
  table {
    width: 100%;
    border-collapse: collapse;
  }
  td, th {
    border: 1px solid #ccc;
    padding: 8px;
  }
  input {
    width: 100%;
  }
  button {
    margin: 0 4px;
  }
  </style>
  