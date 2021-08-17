const express = require("express");
const dotenv = require("dotenv");
const databaseconfiguration = require("./Config/DatabaseConfig");
const {
  authRoute,
  profileRoute,
  scheduleRoute,
} = require("./Routes/AllRoutes");
const {VerifyCurrentToken} = require('./Middleware/AuthMiddleware');
const cookieParser = require('cookie-parser');

// load the env variables
dotenv.config({ path: "./config/config.env" });

const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.json());

const PORT = process.env.PORT || 3500;

databaseconfiguration();

app.use("/api", authRoute);
app.use("/api", profileRoute);
app.use("/api", scheduleRoute);

app.get("/", VerifyCurrentToken, (httprequest, httpresponse) => {
  return httpresponse.json({
    message: "Advanced mobile Programming, Final Project",
  });
});

app.listen(PORT, () => {
  console.log(`Server is running at ${PORT}`);
});

// data base handler
process.on("unhandledRejection", (err, promise) => {
  console.log(`Error: ${err.message}`);
  server.close(() => process.exit(1));
});

