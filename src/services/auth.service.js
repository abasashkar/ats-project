const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const User = require("../models/user.model");
const RefreshToken = require("../models/refreshToken.model");
const { JWT_ACCESS_SECRET, JWT_REFRESH_SECRET } = require("../config/env");
const AppError = require("../utils/AppError");

// Helper
const generateAccessToken = (user) => {
  return jwt.sign(
    { id: user._id, role: user.role },
    JWT_ACCESS_SECRET,
    { expiresIn: "15m" }
  );
};

const generateRefreshToken = async (user) => {
  const refreshToken = jwt.sign(
    { id: user._id },
    JWT_REFRESH_SECRET,
    { expiresIn: "7d" }
  );

  const hashedToken = crypto
    .createHash("sha256")
    .update(refreshToken)
    .digest("hex");

  await RefreshToken.create({
    user: user._id,
    token: hashedToken,
    expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000)
  });

  return refreshToken;
};


exports.register = async (data) => {
  const existingUser = await User.findOne({ email: data.email });
  if (existingUser) {
    throw new AppError("Email already registered", 400);
  }

  const hashed = await bcrypt.hash(data.password, 10);

  const user = await User.create({
    ...data,
    password: hashed
  });

  return user;
};

exports.login = async (email, password) => {
  const user = await User.findOne({ email });
  if (!user) throw new AppError("User not found", 404);

  const valid = await bcrypt.compare(password, user.password);
  if (!valid) throw new AppError("Invalid credentials", 401);

  const accessToken = generateAccessToken(user);
  const refreshToken = await generateRefreshToken(user);

  return { user, accessToken, refreshToken };
};


exports.refresh = async (token) => {
  if (!token) throw new AppError("No refresh token", 401);

  const decoded = jwt.verify(token, JWT_REFRESH_SECRET);

  const hashedToken = require("crypto")
    .createHash("sha256")
    .update(token)
    .digest("hex");

const storedToken = await RefreshToken.findOne({
  user: decoded.id,
  token: hashedToken,
  expiresAt: { $gt: new Date() }
});

  if (!storedToken) throw new AppError("Invalid refresh token", 401);

  const user = await User.findById(decoded.id);
  const newAccessToken = jwt.sign(
    { id: user._id, role: user.role },
    JWT_ACCESS_SECRET,
    { expiresIn: "15m" }
  );

  return newAccessToken;
};

exports.logout = async (refreshToken) => {
  const hashedToken = require("crypto")
    .createHash("sha256")
    .update(refreshToken)
    .digest("hex");

  await RefreshToken.deleteOne({ token: hashedToken });
};