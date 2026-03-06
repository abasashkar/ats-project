const router = require("express").Router();
const auth = require("../middleware/auth.middleware");
const subscriptionCheck = require("../middleware/subscription.middleware");
const controller = require("../controllers/analysis.controller");
const multer = require("multer");

// =============================
// MULTER CONFIG
// =============================
const upload = multer({
  storage: multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024, // 5MB limit
  },
});

// =============================
// ANALYZE RESUME
// =============================
router.post(
  "/analyze",
  auth,
  subscriptionCheck,
  upload.single("resume"),
  controller.analyze
);

// =============================
// DOWNLOAD RESUME (PDF)
// =============================
router.get(
  "/download/:id",
  auth,
  controller.download
);

// =============================
// GET ANALYSIS HISTORY
// =============================
router.get(
  "/history",
  auth,
  controller.getHistory
);

// =============================
// GET SINGLE RESUME DETAILS
// =============================
router.get(
  "/:id",
  auth,
  controller.getSingleResume
);

module.exports = router;