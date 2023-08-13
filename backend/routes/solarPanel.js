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
    .sort({ wattage: order });
  res.send(solarPanel);
});
router.get("/sort/price", async (req, res) => {
  const order = req.query.order === "asc" ? 1 : -1;
  const solarPanel = await SolarPanel.find({})
    .populate("seller")
    .sort({ price: order });
  res.send(solarPanel);
});
router.post("/:id/image", async (req, res) => {
  const solarPanel = await SolarPanel.findById(req.params.id);
  solarPanel.image.append(req.body.image);
  await solarPanel.save();
  res.send("Image uploaded successfully");
});
module.exports = router;
