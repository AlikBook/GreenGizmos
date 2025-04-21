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
            return res
              .status(500)
              .json({ message: "User registration failed" });
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

      if (!match)
        return res.status(401).json({ message: "Invalid credentials" });

      const token = jwt.sign(
        { user_id: user.user_id, role: user.role },
        process.env.JWT_SECRET,
        { expiresIn: "1d" }
      );

      res.json({ token, role: user.role });
    }
  );
});

// Routes for the Cart

app.post("/cart", verifyToken, (req, res) => {
  const { product_id, quantity } = req.body;
  const user_id = req.user.user_id; // Récupère l'ID de l'utilisateur depuis le token

  const query = `
    INSERT INTO Cart (user_id, product_id, quantity)
    VALUES (?, ?, ?)
    ON DUPLICATE KEY UPDATE quantity = quantity + ?;
  `;

  connection.query(
    query,
    [user_id, product_id, quantity, quantity],
    (err, results) => {
      if (err) {
        console.error("Error adding product to cart:", err);
        return res.status(500).json({ error: "Server error" });
      }
      res.json({ message: "Product added to cart successfully" });
    }
  );
});

app.get("/cart", verifyToken, (req, res) => {
  const user_id = req.user.user_id; // Récupère l'ID de l'utilisateur depuis le token

  const query = `
    SELECT c.cart_id, c.quantity, p.product_name, p.product_price, p.product_description
    FROM Cart c
    JOIN Products p ON c.product_id = p.product_id
    WHERE c.user_id = ?;
  `;

  connection.query(query, [user_id], (err, results) => {
    if (err) {
      console.error("Error fetching cart items:", err);
      return res.status(500).json({ error: "Server error" });
    }
    res.json(results);
  });
});

/*app.put("/cart", verifyToken, (req, res) => {
  const { product_id, quantity } = req.body;
  const user_id = req.user.user_id; // Récupère l'ID de l'utilisateur depuis le token

  const query = `
    UPDATE Cart
    SET quantity = ?
    WHERE user_id = ? AND product_id = ?;
  `;

  connection.query(query, [quantity, user_id, product_id], (err, results) => {
    if (err) {
      console.error("Error updating cart item:", err);
      return res.status(500).json({ error: "Server error" });
    }
    res.json({ message: "Cart item updated successfully" });
  });
});

app.delete("/cart", verifyToken, (req, res) => {
  const { product_id } = req.body;
  const user_id = req.user.user_id; // Récupère l'ID de l'utilisateur depuis le token

  const query = `
    DELETE FROM Cart
    WHERE user_id = ? AND product_id = ?;
  `;

  connection.query(query, [user_id, product_id], (err, results) => {
    if (err) {
      console.error("Error deleting cart item:", err);
      return res.status(500).json({ error: "Server error" });
    }
    res.json({ message: "Cart item removed successfully" });
  });
});

app.delete("/cart/all", verifyToken, (req, res) => {
  const user_id = req.user.user_id; // Récupère l'ID de l'utilisateur depuis le token

  const query = `
    DELETE FROM Cart
    WHERE user_id = ?;
  `;

  connection.query(query, [user_id], (err, results) => {
    if (err) {
      console.error("Error clearing cart:", err);
      return res.status(500).json({ error: "Server error" });
    }
    res.json({ message: "Cart cleared successfully" });
  });
});*/
