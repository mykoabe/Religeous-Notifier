const express = require("express");
const dotenv = require("dotenv");
const databaseconfiguration = require("./Config/DatabaseConfig");
const AllRoutes = require("./Routes/AllRoutes");
const { VerifyCurrentToken } = require("./Middleware/AuthMiddleware");
const cookieParser = require("cookie-parser");
const errorHandler = require("./Middleware/error");
var cors = require("cors");

// load the env variables
dotenv.config({ path: "./Config/config.env" });

databaseconfiguration();
const app = express();
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.json());

const PORT = process.env.PORT || 3500;

app.use("/api", AllRoutes);
app.use(errorHandler);

app.get("/", VerifyCurrentToken, (httprequest, httpresponse) => {
  return httpresponse.json({
    message: "Advanced mobile Programming, Final Project",
  });
});

const server = app.listen(PORT, () => {
  console.log(`Server is running at ${PORT}`);
});

// data base handler
process.on("unhandledRejection", (err, promise) => {
  console.log(`Error: ${err.message}`);
  server.close(() => process.exit(1));
});
// sudo lsof -i :3500
//kill -9 {PID} to kill if the port is used by another process
