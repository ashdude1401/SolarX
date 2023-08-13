const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userSchema = new Schema({
  userId: {
    type: String,
    required: true,
    unique: true,
  },
  username: {
    type: String,
    unique: true,
    sparse: true,
  },
  email: {
    type: String,
    unique: true,
    sparse: true,
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
  location: {
    type: {
      type: String,
      enum: ["Point"],
    },
    coordinates: {
      type: [Number],
    },
  },
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

module.exports = mongoose.model("User", userSchema);
