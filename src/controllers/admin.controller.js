exports.getDashboard = async (req, res) => {
  res.json({
    success: true,
    message: "Welcome Admin",
    user: req.user
  });
};