if (process.env.NODE_ENV !== "production") {
  require("dotenv").config();
}

const express = require("express");
const mongoose = require("mongoose");
const app = express();
const cors = require("cors");
const Review = require("./models/review");
const Bill = require("./models/bill");
const userRouter = require("./routes/user");
const sellerRouter = require("./routes/seller");
const solarPanelRouter = require("./routes/solarPanel");
const bodyParser = require("body-parser");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
mongoose
  .connect(process.env.DATABASE_URL)
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((err) => {
    console.log(err);
  });
app.use(cors());
app.use("/home", (req, res) => {
  res.send("This is home page");
});
app.use("/user", userRouter);
app.use("/seller", sellerRouter);
app.use("/solarPanel", solarPanelRouter);
app.use("*", (req, res) => {
  res.status(400).send("Invalid request");
});
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`listening at ${port}`);
});
