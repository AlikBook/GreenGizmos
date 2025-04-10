const express = require("express");
const app = express();
const mysql = require("mysql2");
const cors = require("cors");
const PORT = 3000;

require("dotenv").config();
app.use(cors());

app.use(express.json()); // Pour lire le JSON

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

connection.connect((err) => {
  if (err) {
    console.error("Erreur de connexion à la base de données:", err.stack);
    return;
  }
  console.log(
    "Connexion réussie à la base de données avec l'ID",
    connection.threadId
  );
});

app.get("/", (req, res) => {
  res.send("Hello depuis le backend Node.js !");
});

app.get("/products", (req, res) => {
  connection.query("SELECT * FROM products", (err, results) => {
    if (err) {
      console.error("Error while getting the products:", err);
      return res.status(500).json({ error: "Server error" });
    }
    res.json(results);
  });
});

app.get("/products_by_category", async (req, res) => {
  const category = req.query.category; // Récupère la catégorie depuis la requête
  try {
    const [rows] = await connection.promise().execute(
      `
      SELECT p.* 
      FROM Products p
      JOIN Belongs_to bt ON p.product_id = bt.product_id
      JOIN Categories c ON bt.category_name = c.category_name
      WHERE c.category_name = ?
      `,
      [category]
    );
    res.json(rows); // Retourne les produits trouvés
  } catch (error) {
    console.error("Error fetching products by category:", error);
    res.status(500).send("Error fetching products by category");
  }
});

app.listen(PORT, () => {
  console.log(`Backend server started on http://localhost:${PORT}`);
});
