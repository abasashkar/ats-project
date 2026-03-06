const User = require("../models/user.model");

exports.getSubscriptionStatus = async (userId) => {
  const user = await User.findById(userId).populate("plan");

 if (!user)
  throw new AppError("User not found", 404);

if (!user.plan)
  throw new AppError("User plan not assigned", 400);

  const now = new Date();

  let daysRemaining = 0;

  if (user.subscriptionExpiresAt) {
    const diff = user.subscriptionExpiresAt - now;
    daysRemaining = Math.max(
      0,
      Math.ceil(diff / (1000 * 60 * 60 * 24))
    );
  }

  return {
    subscription: user.plan?.name || "FREE",
    expiry: user.subscriptionExpiresAt,
    daysRemaining
  };
};