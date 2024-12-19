import express from "express";
import * as dotenv from "dotenv";
const bodyParser = require("body-parser");
const http = require("http");
const helmet = require("helmet");
const cors = require("cors");
const winston = require("winston");
const path = require("path");
const fs = require("fs");

//typeorm
import "reflect-metadata";
import { createConnection } from "typeorm";

//Routes
import { router } from "./src/routes/router";

import { getRepository } from "typeorm";

dotenv.config({ path: ".env" });

const ADMIN_PORT = process.env.ADMIN_PORT || "7000";

const logger = winston.createLogger({
  level: "info",
  format: winston.format.json(),
  defaultMeta: { service: "user-service" },
  transports: [new winston.transports.File({ filename: "error.log" })],
});

// Conextion to DB
createConnection()
  .then(async (connection) => {
    console.log("Db Conected");
  })
  .catch((error) => console.log(error));

//############################## ADMIN ##############################
const admin_app = express();

admin_app.use(cors());
admin_app.use(bodyParser.urlencoded({ limit: "50mb", extended: false }));
admin_app.use(bodyParser.json({ limit: "50mb" }));
admin_app.options("*", cors());
admin_app.use(helmet());
admin_app.set("port", ADMIN_PORT);
admin_app.set("host", "0.0.0.0");

//Configuration Express
admin_app.use(express.urlencoded({ extended: true }));
admin_app.use(express.json());

//StatisFiles
admin_app.use("/images", express.static("./src/files"));

//Routes
admin_app.use("/api", router);

admin_app.use("/", express.static(path.join(__dirname, "admin")));
//COMMENTED TO RUN LOCALHOST
admin_app.get("/*", (req, res) => {
  /*  res.sendFile(path.join(__dirname, 'admin/index.html')); */
});

admin_app.use(function (err, req, res, next) {
  console.error(err);
  logger.log({
    level: "error",
    time: new Date().toLocaleDateString("es-HN", {
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
      hour: "2-digit",
      minute: "2-digit",
      second: "2-digit",
    }),
    message: err,
  });
  res.status(500).send({
    title: "Error interno del servidor",
    message: "Revise su conexión de internet o inténtelo más tarde",
  });
});

//Up server
const admin_server = http.createServer(admin_app);
admin_server.listen(ADMIN_PORT, () =>
  console.log(`Running admin on 127.0.0.1:${ADMIN_PORT}`)
);

console.log(4);
