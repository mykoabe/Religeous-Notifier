import { VerifyCurrentToken } from "./Middleware/AuthMiddleware.js";
// import {errorHandler} from "./Middleware/error.js";
import {databaseconfiguration} from './Config/DatabaseConfig.js'
import express from 'express'
import bodyParser from 'body-parser'
import jwt from 'jsonwebtoken';

import allroutes from './Routes/AllRoutes.js'

databaseconfiguration();
const app = express();
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())


const PORT = process.env.PORT || 3500;

app.use("/api", allroutes);
// app.use(errorHandler);

app.get("/", VerifyCurrentToken, (httprequest, httpresponse) => {
  httpresponse.json({
    message: "Advanced mobile Programming, Final Project",
  });
});

const server = app.listen(PORT, () => {
  console.log(`Server is running at ${PORT}`);
});

// data base handler

// process.on("unhandledRejection", (err, promise) => {
//   console.log(`Error: ${err.message}`);
//   server.close(() => process.exit(1));
// });

// sudo lsof -i :3500
//kill -9 {PID} to kill if the port is used by another process
