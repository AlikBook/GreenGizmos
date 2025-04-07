const express = require("express");
const app = express();
const PORT = 3000;

app.use(express.json()); // Pour lire le JSON

app.get("/", (req, res) => {
  res.send("Hello depuis le backend Node.js !");
});

app.get("/products", (req, res) => {
  const products = [
    { id: 1, name: "Product 1", price: 10 },
    { id: 2, name: "Product 2", price: 20 },
    { id: 3, name: "Product 3", price: 30 },
  ];
  res.json(products);
});

app.listen(PORT, () => {
  console.log(`Backend server started on http://localhost:${PORT}`);
});
