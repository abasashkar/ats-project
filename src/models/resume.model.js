const mongoose = require("mongoose");

const resumeSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
  resumeText: String,
  jobDescription: String,
  atsScore: Number,
  missingKeywords: [String],
  optimizedResume: String,
}, { timestamps: true });

module.exports = mongoose.model("Resume", resumeSchema);