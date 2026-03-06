const router = require("express").Router();
const auth = require("../middleware/auth.middleware");
const controller = require("../controllers/subscription.controller");

router.get("/status", auth, controller.getStatus);

module.exports = router;