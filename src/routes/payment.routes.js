const router = require("express").Router();
const auth = require("../middleware/auth.middleware");
const controller = require("../controllers/payment.controller");

router.post("/create-order", auth, controller.createOrder);
router.post("/verify", auth, controller.verifyPayment);
// router.post(
//   "/webhook",
//   express.raw({ type: "application/json" }),
//   controller.handleWebhook
// );

module.exports = router;