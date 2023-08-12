const express = require("express");
const SolarPanel = require("../models/solarPanel");
const router = express.Router();

router.get("/", async (req, res) => {
  const solarPanel = await SolarPanel.find({}).populate("seller");
  res.send(solarPanel);
});
router.get("/sort/wattage", async (req, res) => {
  const order = req.query.order === "asc" ? 1 : -1;
  const solarPanel = await SolarPanel.find({})
    .populate("seller")
    .sort({ wattage: -1 });
  res.send(solarPanel);
});
router.get("/sort/price", async (req, res) => {
  const order = req.query.order === "asc" ? 1 : -1;
  const solarPanel = await SolarPanel.find({})
    .populate("seller")
    .sort({ price: -1 });
  res.send(solarPanel);
});
module.exports = router;
