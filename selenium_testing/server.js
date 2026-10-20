
const express = require("express");
const path = require("path");

const app = express();

// Serve frontend files
app.use(express.static(path.join(__dirname, "public")));

app.listen(3001, () => {
    console.log("Server running at http://localhost:3001");
});
