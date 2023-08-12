const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const sellerSchema = new Schema({
  userId: {
    type: String,
    required: true,
    unique: true,
  },
  username: {
    type: String,
    unique: true,
  },
  email: {
    type: String,
    unique: true,
  },
  companyName: {
    type: String,
  },
  companyImage: {
    type: String,
  },
  firstName: {
    type: String,
    required: true,
  },
  lastName: {
    type: String,
  },
  image: {
    type: String,
  },
  address: {
    type: String,
  },
  city: {
    type: String,
  },
  zipCode: {
    type: Number,
  },
  country: {
    type: String,
  },
  phoneNumber: [
    {
      countryCode: {
        type: Number,
        default: 91,
      },
      number: {
        type: Number,
      },
    },
  ],
  solarPanels: [
    {
      type: Schema.Types.ObjectId,
      ref: "SolarPanel",
    },
  ],
  reviews: [
    {
      type: Schema.Types.ObjectId,
      ref: "Review",
    },
  ],
  orders: [
    {
      bill: {
        type: Schema.Types.ObjectId,
        ref: "Bill",
      },
      status: {
        type: String,
        enum: ["fulfilled", "not fulfilled"],
        default: "not fulfilled",
      },
    },
  ],
});

module.exports = mongoose.model("Seller", sellerSchema);
