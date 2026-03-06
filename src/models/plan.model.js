const mongoose = require("mongoose");

const planSchema = new mongoose.Schema({
  name: { type: String, required: true, unique: true },
  price: { type: Number, required: true },

  resumeLimit: { type: Number, default: 0 },      // -1 = unlimited
  downloadLimit: { type: Number, default: 0 },
  aiUsageLimit: { type: Number, default: 0 },

  durationDays: { type: Number, required: true }
});

module.exports = mongoose.model("Plan", planSchema);