import { 
    Signup , 
    Signin,
 } from "../Controller/AuthController.js";

import express from 'express'

export const authRoute = express.Router();

authRoute.post('/RegisterUser',  Signup);

authRoute.post('/LoginUser',  Signin);

