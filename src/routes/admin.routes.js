const router = require("express").Router();
const auth = require("../middleware/auth.middleware");
const role = require("../middleware/role.middleware");
const controller = require("../controllers/admin.controller");

// Only ADMIN can access
router.get("/dashboard", auth, role("ADMIN"), controller.getDashboard);

module.exports = router;