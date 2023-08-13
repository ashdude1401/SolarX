const express = require("express");
const SolarPanel = require("../models/solarPanel");
const router = express.Router();

router.get("/", async (req, res) => {
  const solarPanel = await SolarPanel.find({}).populate("seller");
  res.send(solarPanel);
});
router.get("/sort/wattage", async (req, res) => {
  const solarPanel = await SolarPanel.find({})
    .populate("seller")
    .sort({ wattage: -1 });
  res.send(solarPanel);
});
router.get("/sort/price", async (req, res) => {
  const solarPanel = await SolarPanel.find({})
    .populate("seller")
    .sort({ price: -1 });
  res.send(solarPanel);
});
router.get("/sort/efficiency", async (req, res) => {
  const solarPanel = await SolarPanel.find({})
    .populate("seller")
    .sort({ efficiency: -1 });
  res.send(solarPanel);
});
router.get("/:id", async (req, res) => {
  const solarPanel = await SolarPanel.findById(req.params.id).populate(
    "seller"
  );
  res.send(solarPanel);
});

router.get("/compare", (req, res) => {
  const panel1 = req.query.panel1;
  const panel2 = req.query.panel2;
  var c1, c2;
});

router.post("/:id/image", async (req, res) => {
  const solarPanel = await SolarPanel.findById(req.params.id);
  solarPanel.image = req.body.image;
  await solarPanel.save();
  res.send("Image uploaded successfully");
});

module.exports = router;
