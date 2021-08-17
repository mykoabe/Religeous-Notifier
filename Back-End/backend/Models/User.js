const mongoose = require("mongoose");

const UserFields = {
  fullName: {
    type: String,
    default: null,
    required: true,
  },

  userName: {
    type: String,
    default: null,
    required: true,
  },
  emailAddress: {
    type: String,
    default: null,
    required: true,
  },

  password: {
    type: String,
    default: null,
    required: true,
  },
  confirmPassword: {
    type: String,
    default: null,
    required: true,
  },
  userRole: {
    type: String,
    default: null,
    required: true,
  },
};

const UserSchema = new mongoose.Schema(UserFields);

const UserModel = mongoose.model("user", UserSchema);

module.exports = UserModel;
UserModel;
