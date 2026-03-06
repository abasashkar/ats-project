const User = require("../models/user.model");
const Plan = require("../models/plan.model");

const AppError = require("../utils/AppError");

const subscriptionCheck = async (req, res, next) => {
  try {
    const user = await User.findById(req.user.id).populate("plan");

    if (!user) {
      return next(new AppError("User not found", 404));
    }

    const now = new Date();

    if (
      user.subscriptionExpiresAt &&
      user.subscriptionExpiresAt < now
    ) {
      const freePlan = await Plan.findOne({ name: "FREE" });

      if (!freePlan) {
        return next(new AppError("FREE plan not configured", 500));
      }

      user.plan = freePlan._id;
      user.subscriptionExpiresAt = null;
      await user.save();
    }

    next();
  } catch (error) {
    next(error);
  }
};

module.exports = subscriptionCheck;