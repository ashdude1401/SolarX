if (process.env.NODE_ENV !== "production") {
  require("dotenv").config();
}

const express = require("express");
const mongoose = require("mongoose");
const app = express();
const cors = require("cors");
const userRouter = require("./routes/user");
const sellerRouter = require("./routes/seller");
mongoose
  .connect(process.env.DATABASE_URL)
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((err) => {
    console.log(err);
  });
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use("/user", userRouter);
app.use("/seller", sellerRouter);
app.use("*", (req, res) => {
  res.status(400).send("Invalid request");
});
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`listening at ${port}`);
});
