const express = require("express");
const app = express();
const mysql = require("mysql2");
const cors = require("cors");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

require("dotenv").config();
app.use(cors());
app.use(express.json());

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  port: process.env.DB_PORT,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

pool.getConnection((err, connection) => {
  if (err) {
    console.error("Erreur de connexion à la base de données:", err.stack);
    return;
  }
  console.log("Connexion réussie à la base de données !");
  connection.release();
  createDefaultAdmin();
});

app.get("/", (req, res) => {
  res.send("Hello depuis le backend Node.js !");
});

app.get("/products", (req, res) => {
  pool.query("SELECT * FROM products", (err, results) => {
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
    const [rows] = await pool.promise().execute(
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
    const [rows] = await pool.promise().execute(
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

app.get("/categories", async (req, res) => {
  try {
    const [rows] = await pool
      .promise()
      .execute("SELECT category_name FROM Categories");
    res.json(rows);
  } catch (error) {
    console.error("Error fetching categories:", error);
    res.status(500).send("Error fetching categories");
  }
});

app.post("/register", async (req, res) => {
  const { username, email, password, role = "user" } = req.body;

  // Check if the email already exists
  pool.query(
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
      pool.query(
        "INSERT INTO users (username, email, password, registration_date, role) VALUES (?, ?, ?, CURRENT_DATE, ?)",
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

  pool.query(
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

// Adding a product to the cart
app.post("/cart", verifyToken, (req, res) => {
  const { product_id, quantity } = req.body; // Assuming quantity is sent in the request body
  const user_id = req.user.user_id; // Get the user_id from the token

  const query = `
    INSERT INTO Cart (user_id, product_id, quantity)
    VALUES (?, ?, ?)
    ON DUPLICATE KEY UPDATE quantity = quantity + ?;
  `;

  pool.query(
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

// Fetching the cart items for a user
app.get("/cart", verifyToken, (req, res) => {
  const user_id = req.user.user_id; // Get the user_id from the token

  const query = `
    SELECT * FROM Cart c WHERE c.user_id = ?;
  `;

  pool.query(query, [user_id], (err, results) => {
    if (err) {
      console.error("Error fetching cart items:", err);
      return res.status(500).json({ error: "Server error" });
    }
    res.json(results);
  });
});

// Deleting a product from the cart
app.delete("/cart", verifyToken, (req, res) => {
  const { product_id } = req.body; // Assuming product_id is sent in the request body
  const user_id = req.user.user_id; // Get the user_id from the token

  const query = `
    DELETE FROM Cart
    WHERE user_id = ? AND product_id = ?;
  `;

  pool.query(query, [user_id, product_id], (err, results) => {
    if (err) {
      console.error("Error deleting cart item:", err);
      return res.status(500).json({ error: "Server error" });
    }
    res.json({ message: "Cart item removed successfully" });
  });
});

app.post("/add_product", async (req, res) => {
  const { product_name, product_price, product_description, category_name } =
    req.body;

  try {
    const [result] = await pool.promise().execute(
      `
      INSERT INTO Products (product_name, product_price, product_description)
      VALUES (?, ?, ?)
      `,
      [product_name, product_price, product_description]
    );

    const product_id = result.insertId;

    await pool.promise().execute(
      `
      INSERT INTO Belongs_to (product_id, category_name)
      VALUES (?, ?)
      `,
      [product_id, category_name]
    );

    res.status(201).json({ message: "Product added successfully" });
  } catch (error) {
    console.error("Error adding product:", error);
    res.status(500).json({ message: "Error adding product" });
  }
});

app.get("/users", verifyToken, authorizeRoles("admin"), (req, res) => {
  pool.query(
    "SELECT user_id, username, email, registration_date, role FROM users",
    (err, results) => {
      if (err)
        return res.status(500).json({ message: "Failed to fetch users" });
      res.json(results);
    }
  );
});

app.put("/users/:id", verifyToken, authorizeRoles("admin"), (req, res) => {
  const userId = req.params.id;
  const { username, email, role } = req.body;

  pool.query(
    "UPDATE users SET username = ?, email = ?, role = ? WHERE user_id = ?",
    [username, email, role, userId],
    (err) => {
      if (err)
        return res.status(500).json({ message: "Failed to update user" });
      res.json({ message: "User updated successfully" });
    }
  );
});

app.delete("/users/:id", verifyToken, authorizeRoles("admin"), (req, res) => {
  const userId = req.params.id;

  pool.query("DELETE FROM users WHERE user_id = ?", [userId], (err) => {
    if (err) return res.status(500).json({ message: "Failed to delete user" });
    res.json({ message: "User deleted successfully" });
  });
});

app.delete(
  "/delete_product_by_name",
  verifyToken,
  authorizeRoles("admin"),
  async (req, res) => {
    const { product_name } = req.body;

    try {
      await pool.promise().execute(
        `
      DELETE FROM Belongs_to
      WHERE product_id = (SELECT product_id FROM Products WHERE product_name = ?)
      `,
        [product_name]
      );

      const [result] = await pool.promise().execute(
        `
      DELETE FROM Products
      WHERE product_name = ?
      `,
        [product_name]
      );

      if (result.affectedRows === 0) {
        return res.status(404).json({ message: "Product not found" });
      }

      res.status(200).json({ message: "Product deleted successfully" });
    } catch (error) {
      console.error("Error deleting product:", error);
      res.status(500).json({ message: "Error deleting product" });
    }
  }
);

const createDefaultAdmin = async () => {
  try {
    const [rows] = await pool
      .promise()
      .execute("SELECT * FROM users WHERE username = ?", ["admin"]);

    if (rows.length === 0) {
      const hashedPassword = await bcrypt.hash("admin123", 10);
      await pool
        .promise()
        .execute(
          "INSERT INTO users (username, email, password,registration_date, role) VALUES (?, ?, ?,CURRENT_DATE, ?)",
          ["admin", "admin@example.com", hashedPassword, "admin"]
        );
      console.log("Default admin user created.");
    } else {
      console.log("Admin user already exists.");
    }
  } catch (error) {
    console.error("Error creating default admin:", error);
  }
};

module.exports = app;
