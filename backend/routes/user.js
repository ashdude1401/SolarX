const express = require("express");
const User = require("../models/user");
const { isLoggedIn } = require("../middlewares");
const solarEnergy=require("../functions/solar")
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
    phoneNumber,
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

router.get("/calc", async (req, res) => {
  const { area, state_no, Perfomance_ratio, efficiency } = req.body;
  console.log(req.body)
  // energy=solarEnergy(area,state_no,Perfomance_ratio,efficiency)
  // res.send(energy)
});




module.exports = router;
