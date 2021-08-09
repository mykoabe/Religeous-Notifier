import { 
    Signup , 
    Signin,
 } from "../Controller/MainController.js";

import express from 'express'

export const authRoute = express.Router();

authRoute.post('/RegisterUser',  Signup);

authRoute.post('/LoginUser',  Signin);

