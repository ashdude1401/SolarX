const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const solarPanelSchema = new Schema({
  description: {
    type: String,
  },
  brand: {
    type: String,
  },
  model: {
    type: String,
  },
  wattage: {
    type: Number,
  },
  weight: {
    type: Number,
  },
  price: {
    type: Number,
  },
  dimensions: {
    type: String,
  },
  image: { type: String },
  availability: {
    type: String,
    enum: ["available", "sold"],
    default: "available",
  },
  review: {
    type: Schema.Types.ObjectId,
    ref: "Review",
  },
  seller: {
    type: Schema.Types.ObjectId,
    ref: "Seller",
    required: true,
  },
});

module.exports = mongoose.model("SolarPanel", solarPanelSchema);
