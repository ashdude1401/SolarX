const express = require("express");
const User = require("../models/user");
const { isLoggedIn } = require("../middlewares");
const solarEnergy = require("../functions/solar");
const router = express.Router();

router.get("/", async (req, res) => {
  const user = await User.findOne({});
  res.send(user);
});

router.get("/:id", isLoggedIn, async (req, res) => {
  const userId = req.params.id;
  const user = await User.findOne({ userId });
  console.log(user);
  res.send(user);
});

router.post("/signup", async (req, res) => {
  console.log(req.body);
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
    location,
  } = req.body;
  const user = await User.findOne({ userId });
  console.log(user);
  if (user) {
    console.log("user already exists");
    return res.status(400).send("User already exists");
  }
  console.log("user does not exist");
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
  await newUser.save().then((user) => {
    res.send("SignUp successfull");
  });
  // .catch((err) => {
  //   res.status(400).send(err);
  // });
});

router.post("/calc", async (req, res) => {
  const { area, stateNo, perfomanceRatio, efficiency } = req.body;
  energy = solarEnergy(area, stateNo, perfomanceRatio, efficiency);
  res.send({ energy });
});

module.exports = router;
