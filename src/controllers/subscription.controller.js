const subscriptionService = require("../services/subscription.service");

exports.getStatus = async (req, res, next) => {
  try {
    const status = await subscriptionService.getSubscriptionStatus(
      req.user.id
    );

    res.json({
      success: true,
      ...status
    });
  } catch (err) {
    next(err);
  }
};