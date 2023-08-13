const express = require("express");
const Seller = require("../models/seller");
const SolarPanel = require("../models/solarPanel");
const { isLoggedIn } = require("../middlewares");
const router = express.Router();
const upload = require("../middleware/multer");
const sharp = require("sharp");
const AWS = require("aws-sdk");
const { v4: uuidv4 } = require("uuid");

BUCKET_NAME = process.env.BUCKET_NAME;
BUCKET_REGION = process.env.BUCKET_REGION;
ACCESS_KEY = process.env.ACCESS_KEY;
SECRET_ACCESS_KEY = process.env.SECRET_ACCESS_KEY;

const s3 = new AWS.S3({
  credentials: {
    accessKeyId: ACCESS_KEY,
    secretAccessKey: SECRET_ACCESS_KEY,
  },
  region: BUCKET_REGION,
});

router.get("/", async (req, res) => {
  const sellers = await Seller.find({});
  res.send(sellers);
});

router.get("/:id", isLoggedIn, async (req, res) => {
  const userId = req.params.id;
  const seller = await Seller.findOne({ userId }).populate("solarPanels");
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
  const solarPanel = await SolarPanel.findOne({
    seller: seller._id,
    brand,
    model,
  });
  if (solarPanel) {
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

router.get("/:id/image", isLoggedIn, async (req, res) => {
  const userId = req.params.userId;
  const user = Seller.find({ userId });
  user.image = req.body.image;
  await user.save();
  res.send("Image added successfully");
});

router.post("/uploadImage", upload.single("image"), async (req, res) => {
  try {
    const newId = uuidv4();
    console.log(req.file.buffer);
    const buffer = await sharp(req.file.buffer)
      .resize({ height: 1920, width: 1080, fit: "contain" })
      .toBuffer();
    const params = {
      Bucket: BUCKET_NAME + `/main/user/solar`,
      Key: newId,
      Body: buffer,
      ContentType: req.file.mimetype,
      ACL: "public-read",
    };
    await s3.putObject(params).promise();
    imageUrl = `https://${BUCKET_NAME}.s3.amazonaws.com/main/user/solar/${newId}`;

    res.send(imageUrl);
  } catch (err) {
    res.send({
      success: false,
      msg: err.message || "Error Occurred while uploading image",
    });
  }
});

module.exports = router;
