const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const reviewSchema = new Schema({
  user: {
    type: Schema.Types.ObjectId,
    ref: "User",
  },
  rating: {
    type: Number,
  },
  comment: {
    type: String,
  },
});

module.exports = mongoose.model("Review", reviewSchema);
