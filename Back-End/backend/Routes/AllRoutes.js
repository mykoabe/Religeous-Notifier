import { Signup, Signin } from "../Controller/AuthController.js";
import { deletePofile, updateProfile } from "../Controller/ProfileController.js";
import { createSchedule, deleteSchedule, getallSchedules, updateSchedule } from "../Controller/ScheduleController.js";

import express from "express";

import { VerifyCurrentToken } from "../Middleware/AuthMiddleware.js";

// Auth Router

const allroutes = express.Router() ;

allroutes.post("/RegisterUser", Signup);

allroutes.post("/LoginUser", Signin);

// Profile allroutes

allroutes.delete("/DeleteProfile", VerifyCurrentToken, deletePofile);

allroutes.put("/UpdateProfile", updateProfile);

//ScheduleRoute

allroutes.post("/createSchedule", createSchedule);

allroutes.delete("/deleteSchedule/:id?", deleteSchedule);

allroutes.put("/updateSchedule", updateSchedule);

allroutes.get("/getallSchedules", getallSchedules);

export default allroutes;
