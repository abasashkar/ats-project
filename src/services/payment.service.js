const Razorpay = require("razorpay");
const crypto = require("crypto");
const User = require("../models/user.model");
const Plan = require("../models/plan.model");
const { RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET } = require("../config/env");
const Payment = require("../models/payment.model");

const razorpay = new Razorpay({
  key_id: RAZORPAY_KEY_ID,
  key_secret: RAZORPAY_KEY_SECRET
});

// Create Order
exports.createOrder = async (userId) => {

  const proPlan = await Plan.findOne({ name: "PRO" });
  if (!proPlan) throw new Error("PRO plan not found");

  const options = {
    amount: proPlan.price * 100,
    currency: "INR",
    receipt: `rcpt_${userId.slice(-6)}_${Date.now()}`
  };

  const order = await razorpay.orders.create(options);

  await Payment.create({
    userId,
    razorpayOrderId: order.id,
    amount: order.amount,
    currency: order.currency,
    status: "created"
  });

  return order;
};

// Verify Payment
exports.verifyPayment = async (userId, data) => {

  const { razorpay_order_id, razorpay_payment_id, razorpay_signature } = data;

  if (!razorpay_order_id || !razorpay_payment_id || !razorpay_signature) {
    throw new Error("Missing payment details");
  }

  const body = razorpay_order_id + "|" + razorpay_payment_id;

  const expectedSignature = crypto
    .createHmac("sha256", RAZORPAY_KEY_SECRET)
    .update(body)
    .digest("hex");

  if (expectedSignature !== razorpay_signature) {
    throw new Error("Payment verification failed");
  }

  const payment = await Payment.findOne({
    razorpayOrderId: razorpay_order_id
  });

  if (!payment) throw new Error("Payment record not found");
  if (payment.status === "paid") return;

  payment.razorpayPaymentId = razorpay_payment_id;
  payment.status = "paid";
  await payment.save();

  const user = await User.findById(userId);
  if (!user)   throw new AppError("User not found", 404);

  const proPlan = await Plan.findOne({ name: "PRO" });
  if (!proPlan) throw new Error("PRO plan not found");

  const now = new Date();

  const baseDate =
    user.subscriptionExpiresAt &&
    user.subscriptionExpiresAt > now
      ? user.subscriptionExpiresAt
      : now;

  const newExpiry = new Date(baseDate);
  newExpiry.setDate(newExpiry.getDate() + proPlan.durationDays);

  user.plan = proPlan._id;
  user.subscriptionExpiresAt = newExpiry;
  user.resumeCount = 0;
  user.downloadsUsed = 0;

  await user.save();

  return user;
};