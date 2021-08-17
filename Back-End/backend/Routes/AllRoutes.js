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

const router = express.Router();

router.post("/RegisterUser", Signup);

router.post("/LoginUser", Signin);

// Profile Router

router.delete("/DeleteProfile", VerifyCurrentToken, deletePofile);

router.put("/UpdateProfile", updateProfile);

//ScheduleRoute

router.post("/createSchedule", createSchedule);

router.delete("/deleteSchedule/:id?", deleteSchedule);

router.put("/updateSchedule", updateSchedule);

router.get("/getallSchedules", getallSchedules);

module.exports = router;
