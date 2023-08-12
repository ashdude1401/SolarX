const express = require("express");
const Seller = require("../models/seller");
const SolarPanel = require("../models/solarPanel");
const { isLoggedIn } = require("../middlewares");
const router = express.Router();

router.get("/", async (req, res) => {
  const sellers = await Seller.find({});
  res.send(sellers);
});

router.get("/:id", isLoggedIn, async (req, res) => {
  const userId = req.params.id;
  const seller = await Seller.findOne({ userId })
    .populate("solarPanels")
    .populate("reviews");
  res.send(seller);
});

router.post("/signup", isLoggedIn, async (req, res) => {
  console.log(req.body);
  const {
    userId,
    email,
    firstName,
    lastName,
    username,
    companyName,
    companyImage,
    image,
    address,
    city,
    zipCode,
    country,
    countryCode,
    number,
    location,
  } = req.body;
  const seller = await Seller.findOne({ userId });
  if (seller) {
    return res.status(400).send("seller already exists");
  }
  const newSeller = new Seller({
    userId,
    email,
    firstName,
    lastName,
    username,
    companyName,
    companyImage,
    image,
    address,
    city,
    zipCode,
    country,
    phoneNumber: { countryCode, number },
    location,
  });
  await newSeller
    .save()
    .then((seller) => {
      res.send("SignUp successfull");
    })
    .catch((err) => {
      res.status(400).send(err);
    });
});

router.post("/:id/solarPanel", isLoggedIn, async (req, res) => {
  const {
    description,
    dimensions,
    weight,
    brand,
    model,
    wattage,
    price,
    image,
    status,
  } = req.body;
  const userId = req.params.id;
  const seller = await Seller.findOne({ userId });
  const solarPanel = await SolarPanel.findOne({ seller: seller._id });
  if (solarPanel && solarPanel.brand === brand && solarPanel.model === model) {
    return res.status(400).send("Solar Panel already exists");
  }
  const newSolarPanel = new SolarPanel({
    description,
    dimensions,
    weight,
    brand,
    model,
    wattage,
    price,
    image,
    status,
  });
  newSolarPanel.seller = seller._id;
  newSolarPanel.save().then(async (solarPanel) => {
    seller.solarPanels.push(solarPanel);
    await seller.save();
    res.send("Solar Panel added successfully");
  });
});
module.exports = router;
