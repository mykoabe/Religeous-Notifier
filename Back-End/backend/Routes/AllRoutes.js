const { Signup, Signin } = require("../Controller/AuthController");
const {
  deletePofile,
  updateProfile,
} = require("../Controller/ProfileController");
const {
  createSchedule,
  deleteSchedule,
  getallSchedules,
  updateSchedule,
} = require("../Controller/ScheduleController");
const express = require("express");
const { VerifyCurrentToken } = require("../Middleware/AuthMiddleware");

// Auth Router

const authRoute = express.Router();

authRoute.post("/RegisterUser", Signup);

authRoute.post("/LoginUser", Signin);

// Profile Router

const profileRoute = express.Router();

profileRoute.delete("/DeleteProfile", VerifyCurrentToken, deletePofile);

profileRoute.put("/UpdateProfile", updateProfile);

//ScheduleRoute

const scheduleRoute = express.Router();

scheduleRoute.post("/createSchedule", createSchedule);

scheduleRoute.delete("/deleteSchedule/:id?", deleteSchedule);

scheduleRoute.put("/updateSchedule", updateSchedule);

scheduleRoute.get("/getallSchedules", getallSchedules);
module.exports = authRoute;
module.exports = profileRoute;
module.exports = scheduleRoute;