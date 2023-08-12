const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const solarPanelSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  description: {
    type: String,
  },
  brand: {
    type: String,
  },
  model: {
    unique: true,
    type: String,
  },
  wattage: {
    type: Number,
  },
  price: {
    type: Number,
  },
  warranty: {
    type: Number,
  },
  status: {
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
