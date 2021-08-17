import { 
    Signup , 
    Signin,
 } from "../Controller/AuthController.js";

 import { 
     deletePofile,
    updateProfile 
    } from "../Controller/ProfileController.js";
 import {
      createSchedule, 
     deleteSchedule,
     getallSchedules,
     updateSchedule 
    } from "../Controller/ScheduleController.js";

import express from 'express'
import { VerifyCurrentToken } from "../Middleware/AuthMiddleware.js";
// Auth Router 





export const authRoute = express.Router();

authRoute.post('/RegisterUser',  Signup);

authRoute.post('/LoginUser',   Signin);


// Profile Router

export const profileRoute = express.Router();

profileRoute.delete('/DeleteProfile' ,VerifyCurrentToken ,deletePofile);

profileRoute.put('/UpdateProfile' , updateProfile);

//ScheduleRoute

export const scheduleRoute = express.Router();

scheduleRoute.post('/createSchedule' , createSchedule);

scheduleRoute.delete('/deleteSchedule/:id?' ,deleteSchedule);

scheduleRoute.put('/updateSchedule' , updateSchedule)

scheduleRoute.get('/getallSchedules' , getallSchedules )

