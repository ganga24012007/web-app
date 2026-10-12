
const express = require("express");
const mongoose = require("mongoose");
const path = require("path");

const app = express();

// Middleware
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

// 1. Connect to MongoDB
mongoose.connect("mongodb://127.0.0.1:27017/studentDB")
    .then(() => console.log("MongoDB Connected"))
    .catch(err => console.log("MongoDB Error:", err));

// 2. Create Schema
const studentSchema = new mongoose.Schema({
    name: { type: String, required: true },
    studentId: { type: String, required: true },
    dept: { type: String, required: true }
});

// 3. Create Model
const Student = mongoose.model("Student", studentSchema);

// CREATE - Add a student
app.post("/api/students", async (req, res) => {
    try {
        const student = await Student.create(req.body);
        res.status(201).json(student);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// READ + SEARCH - Get all or matching students
app.get("/api/students", async (req, res) => {
    try {
        const search = req.query.search || "";

        const students = await Student.find({
            $or: [
                { name: { $regex: search, $options: "i" } },
                { studentId: { $regex: search, $options: "i" } },
                { dept: { $regex: search, $options: "i" } }
            ]
        });

        res.json(students);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// UPDATE - Edit a student
app.put("/api/students/:id", async (req, res) => {
    try {
        const student = await Student.findByIdAndUpdate(
            req.params.id,
            req.body,
            { new: true, runValidators: true }
        );

        if (!student) {
            return res.status(404).json({ error: "Student not found" });
        }

        res.json(student);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// DELETE - Remove a student
app.delete("/api/students/:id", async (req, res) => {
    try {
        const student = await Student.findByIdAndDelete(req.params.id);

        if (!student) {
            return res.status(404).json({ error: "Student not found" });
        }

        res.json({ message: "Student deleted successfully" });
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// Start server
app.listen(3030, () => {
    console.log("Server running at http://localhost:3030");
});
