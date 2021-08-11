
import express  from 'express'
import databaseconfiguration from './Config/DatabaseConfig.js';
import bodyParser from 'body-parser';

import {
     authRoute  ,
     profileRoute,
     scheduleRoute
    } from './Routes/AllRoutes.js';

    
import { VerifyCurrentToken } from './Middleware/AuthMiddleware.js';
import cookieParser from 'cookie-parser';

const app = express()
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cookieParser());
app.use(bodyParser.json())

const PORT =process.env.PORT||  3500;

databaseconfiguration();


app.use('/api' , authRoute);
app.use('/api' , profileRoute);
app.use('/api' , scheduleRoute )



app.get('/' , VerifyCurrentToken ,(httprequest , httpresponse)=>{
    return httpresponse.json({"message" : "Advanced mobile Programming, Final Project"})
});

app.listen(PORT, ()=>{

    console.log(`Server is running at ${PORT}`)

});