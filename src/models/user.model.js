const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    name: String,
    email: { type: String, unique: true },
    password: String,

    role: { 
      type: String, 
      enum: ["USER", "ADMIN"], 
      default: "USER" 
    },

    plan: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Plan"
    },

    subscriptionExpiresAt: { 
      type: Date, 
      default: null 
    },

    downloadsUsed: { 
      type: Number, 
      default: 0 
    },

    resumeCount: { 
      type: Number, 
      default: 0 
    }  
  },
  { timestamps: true }
);

module.exports = mongoose.model("User", userSchema);