const redis = require("../config/redis");

const rateLimit = async (req, res, next) => {
  try {
    const key = `rate:${req.ip}`;
    const requests = await redis.incr(key);

    if (requests === 1) {
      await redis.expire(key, 60);
    }

    if (requests > 20) {
      return res.status(429).json({ message: "Too many requests" });
    }

    next();
  } catch (error) {
    console.error("Rate limit error:", error);
    next();
  }
};

module.exports = rateLimit;