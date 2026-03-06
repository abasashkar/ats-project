const paymentService = require("../services/payment.service");

exports.createOrder = async (req, res, next) => {
  try {
    const order = await paymentService.createOrder(req.user.id);

    res.json({
      success: true,
      order,
      key: process.env.RAZORPAY_KEY_ID
    });
  } catch (err) {
    next(err);
  }
};

exports.verifyPayment = async (req, res, next) => {
  try {
    await paymentService.verifyPayment(req.user.id, req.body);

    res.json({
      success: true,
      message: "Payment successful. PRO activated."
    });
  } catch (err) {
    next(err);
  }
};
// exports.handleWebhook = async (req, res) => {
//   const secret = process.env.RAZORPAY_WEBHOOK_SECRET;

//   const signature = req.headers["x-razorpay-signature"];

//   const expectedSignature = crypto
//     .createHmac("sha256", secret)
//     .update(req.body)
//     .digest("hex");

//   if (signature !== expectedSignature) {
//     return res.status(400).json({ message: "Invalid webhook signature" });
//   }

//   const event = JSON.parse(req.body.toString());

//   if (event.event === "payment.captured") {
//     const paymentData = event.payload.payment.entity;

//     const payment = await Payment.findOne({
//       razorpayOrderId: paymentData.order_id,
//     });

//     if (!payment) return res.json({ status: "ok" });

//     payment.status = "paid";
//     payment.razorpayPaymentId = paymentData.id;
//     await payment.save();

//     const user = await User.findById(payment.userId);

//     if (user) {
//       const now = new Date();
//       const baseDate =
//         user.subscriptionExpiresAt &&
//         user.subscriptionExpiresAt > now
//           ? user.subscriptionExpiresAt
//           : now;

//       const newExpiry = new Date(baseDate);
//       newExpiry.setDate(newExpiry.getDate() + 30);

//       user.subscription = "PRO";
//       user.subscriptionExpiresAt = newExpiry;
//       await user.save();
//     }
//   }

//   res.json({ status: "ok" });
// };