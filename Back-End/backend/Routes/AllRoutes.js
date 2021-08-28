import { Signup, Signin , getallusers } from "../Controller/AuthController.js";
import { deletePofile, updateProfile } from "../Controller/ProfileController.js";
import { createSchedule, deleteSchedule, getallSchedules, updateSchedule } from "../Controller/ScheduleController.js";
import {createHolyPlace} from "../Controller/HolyplaceController.js"

import express from "express";

import { VerifyCurrentToken } from "../Middleware/AuthMiddleware.js";

// Auth Router

const allroutes = express.Router() ;

allroutes.post("/RegisterUser", Signup);

allroutes.post("/LoginUser", Signin);

// Profile allroutes

allroutes.delete("/DeleteProfile", VerifyCurrentToken, deletePofile);

allroutes.put("/UpdateProfile", updateProfile);
allroutes.get("/getAllUsers" ,getallusers )

//ScheduleRoute



allroutes.post("/createSchedule", createSchedule);

allroutes.delete("/deleteSchedule/:id?", deleteSchedule);

allroutes.put("/updateSchedule", updateSchedule);

allroutes.get("/getallSchedules", getallSchedules);

//HolyPlace 

allroutes.post('/createHolyPlace' ,createHolyPlace )

export default allroutes;

