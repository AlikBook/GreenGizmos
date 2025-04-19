const express = require("express");
const app = express();
const mysql = require("mysql2");
const cors = require("cors");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const PORT = 3000;

require("dotenv").config();
app.use(cors());

app.use(express.json()); 

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
  const category = req.query.category; 
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
    res.json(rows); 
  } catch (error) {
    console.error("Error fetching products by category:", error);
    res.status(500).send("Error fetching products by category");
  }
});

app.get("/search_products", async (req, res) => {
  const searchTerm = req.query.q; 
  try {
    const [rows] = await connection.promise().execute(
      `
      SELECT * 
      FROM Products
      WHERE product_name LIKE ? OR product_description LIKE ?
      `,
      [`%${searchTerm}%`, `%${searchTerm}%`] 
    );
    res.json(rows);
  } catch (error) {
    console.error("Error searching products:", error);
    res.status(500).send("Error searching products");
  }
});

app.listen(PORT, () => {
  console.log(`Backend server started on http://localhost:${PORT}`);
});


app.post("/register", async (req, res) => {
  const { username, email, password, role = "user" } = req.body;

  // Check if the email already exists
  connection.query(
    "SELECT * FROM users WHERE email = ?",
    [email],
    async (err, results) => {
      if (err) {
        console.error("Registration error:", err);
        return res.status(500).json({ message: "User registration failed" });
      }

      if (results.length > 0) {
        return res.status(400).json({ message: "Email already exists" });
      }

      const hashedPassword = await bcrypt.hash(password, 10);

      // Insert the new user into the database
      connection.query(
        "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)",
        [username, email, hashedPassword, role],
        (err, results) => {
          if (err) {
            console.error("Registration error:", err);
            return res.status(500).json({ message: "User registration failed" });
          }
          res.status(201).json({ message: "User registered" });
        }
      );
    }
  );
});


function verifyToken(req, res, next) {
  const authHeader = req.headers.authorization;
  if (!authHeader) return res.sendStatus(401);

  const token = authHeader.split(" ")[1];
  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
}

function authorizeRoles(...allowedRoles) {
  return (req, res, next) => {
    if (!allowedRoles.includes(req.user.role)) {
      return res.status(403).json({ message: "Access denied" });
    }
    next();
  };
}

app.get("/admin/data", verifyToken, authorizeRoles("admin"), (req, res) => {
  res.json({ message: "This is only accessible by admins!" });
});

app.post("/login", (req, res) => {
  const { username, password } = req.body;

  connection.query(
    "SELECT * FROM users WHERE username = ?",
    [username],
    async (err, results) => {
      if (err || results.length === 0) {
        return res.status(401).json({ message: "Invalid credentials" });
      }

      const user = results[0];
      const match = await bcrypt.compare(password, user.password);

      if (!match) return res.status(401).json({ message: "Invalid credentials" });

      const token = jwt.sign(
        { user_id: user.user_id, role: user.role },
        process.env.JWT_SECRET,
        { expiresIn: "1d" }
      );

      res.json({ token, role: user.role });
    }
  );
});
