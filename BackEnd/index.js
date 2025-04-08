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

app.listen(PORT, () => {
  console.log(`Backend server started on http://localhost:${PORT}`);
});
