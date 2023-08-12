const express = require("express");
const User = require("../models/user");
const { isLoggedIn } = require("../middlewares");
const solarEnergy = require("../functions/solar");
const router = express.Router();

router.get("/:id", async (req, res) => {
  const userId = req.params.id;
  const user = await User.findOne({ userId });
  console.log(user);
  res.send(user);
});

router.post("/signup", async (req, res) => {
  const {
    userId,
    email,
    firstName,
    lastName,
    username,
    image,
    address,
    city,
    zipCode,
    country,
    countryCode,
    number,
    phoneNumber,
    location,
  } = req.body;
  const user = await User.findOne({ userId });
  if (user) {
    return res.status(400).send("User already exists");
  }
  const newUser = new User({
    userId,
    email,
    firstName,
    lastName,
    username,
    image,
    address,
    city,
    zipCode,
    country,
    phoneNumber: { countryCode, number },
    location,
  });
  await newUser
    .save()
    .then((user) => {
      res.send("SignUp successfull");
    })
    .catch((err) => {
      res.status(400).send(err);
    });
});

router.post("/calc", async (req, res) => {
  const { area, stateNo, perfomanceRatio, efficiency } = req.body;
  energy = solarEnergy(area, stateNo, perfomanceRatio, efficiency);
  res.send({ energy });
});

module.exports = router;
