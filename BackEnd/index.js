const express = require("express");
const app = express();
const PORT = 3000;

app.use(express.json()); // Pour lire le JSON

app.get("/", (req, res) => {
  res.send("Hello depuis le backend Node.js !");
});

app.listen(PORT, () => {
  console.log(`Backend server started on http://localhost:${PORT}`);
});
