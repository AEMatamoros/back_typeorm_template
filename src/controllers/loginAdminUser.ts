const nodemailer = require("nodemailer");

// Tokens - codification
var jwt = require("jsonwebtoken");
const crypto = require("crypto");
const algorithm = "aes-256-cbc";
const key = crypto.randomBytes(32);
const iv = crypto.randomBytes(16);

import { getRepository, getConnection } from "typeorm";
import { NextFunction, Request, Response } from "express";
import { AdminUser } from "../entity/AdminUsers";

const login = async (req: Request, res: Response, next: NextFunction) => {
  let { username, password } = req.query;

  try {
    let userId = await getRepository(AdminUser)
      .createQueryBuilder("adminUser")
      .select("id")
      .where("username = :username", { username })
      .getRawOne();

    if (userId) {
      let adminUser = await getRepository(AdminUser)
        .createQueryBuilder("adminUser")
        .select(["id", "roleId", "username", "first_login"])
        .where("username = :username", { username })
        .andWhere("password = SHA(:password)", { password })
        .andWhere("active = :status", { status: 1 })
        .getRawOne();

      if (adminUser) {
        var token = jwt.sign(
          { id: adminUser.id },
          process.env.TOKEN_SECRET_KEY_ADMIN,
          {
            /*expiresIn: '3h'*/
          }
        );

        res.status(200).json({
          auth: true,
          first_login: adminUser.first_login == 1,
          id: encrypt(adminUser.id + ""),
          name: adminUser.username,
          role: adminUser.roleId,
          token: token,
        });
      } else {
        res.status(400).json({
          auth: false,
          title: "Error de Autenticación",
          message: "Combinación de usuario y contraseña incorrectos",
        });
      }
    }
  } catch (error) {
    next(error);
  }
};

const request_recovery_code = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let { user_email } = req.body;

  try {
    let adminUser = await getRepository(AdminUser)
      .createQueryBuilder("adminUser")
      .select(["id", "username"])
      .where("user_email = :user_email", { user_email })
      .getRawOne();

    if (adminUser) {
      var code = generate_recovery_code(5);

      try {
        transporter.sendMail({
          from: '"FUTV " informacion@futv.com',
          to: user_email,
          subject: "Código de Recuperación",
          html:
            "Estimado/a " +
            adminUser.username +
            ":<br><br>El código para recuperar su usuario o contraseña es el siguiente: <b>" +
            code +
            "</b><br>Ingrese el código proporcionado en el formulario de recuperación de credenciales.",
        });
      } catch (mailer_error) {
        console.log(mailer_error);
      }

      let updateCodeAdmin = await getConnection()
        .createQueryBuilder()
        .update(AdminUser)
        .set({
          restore_code: code,
        })
        .where("id = :id", { id: adminUser.id })
        .execute();

      if (updateCodeAdmin) {
        res.status(200).json({
          id: encrypt(adminUser.id + ""),
          title: "Código de Recuperación Generado",
          message:
            "El código de recuperación se generó y envió a su correo de forma satisfactoria",
        });
      }
    }
  } catch (error) {
    res.status(400).json({
      title: "Error",
      message:
        "Ha ocurrido un error al generar el código de recuperación. Intetelo más tarde.",
    });
  }
};

const validate_recovery_code = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let { user_email, restore_code, id } = req.query;
  try {
    let validateCode = await getRepository(AdminUser)
      .createQueryBuilder("adminUser")
      .select(["id", "username"])
      .where("id = :id", { id: decrypt(id) })
      .andWhere("user_email = :user_email", { user_email })
      .andWhere("restore_code = :restore_code", { restore_code })
      .getRawOne();

    if (validateCode) {
      res.status(200).json({
        id: encrypt(validateCode.id + ""),
        title: "Código de Recuperación Válido",
        message: "El código de recuperación se validó correctamente",
      });
    } else {
      res.status(400).json({
        title: "Error",
        message: "El código de recuperación no es válido",
      });
    }
  } catch (error) {
    next(error);
  }
};

const request_password_change = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let { id, user_email, restore_code, password } = req.body;

  try {
    let adminUser = await getRepository(AdminUser)
      .createQueryBuilder("adminUser")
      .select(["username", "password"])
      .where("id = :id", { id: decrypt(id) })
      .andWhere("user_email = :user_email", { user_email })
      .andWhere("restore_code = :restore_code", { restore_code })
      .getRawOne();

    if (adminUser) {
      if (password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,25}$/)) {
        let updateCode = await getConnection()
          .createQueryBuilder()
          .update(AdminUser)
          .set({
            password: () => `SHA('${password}')`,
            restore_code: "",
          })
          .where("id = :id", { id: decrypt(id) })
          .andWhere("user_email = :user_email", { user_email })
          .andWhere("restore_code = :restore_code", { restore_code })
          .execute();

        if (updateCode) {
          res.status(200).json({
            valid: true,
            title: "Contraseña Cambiada Exitosamente",
            message: "La contraseña se ha cambiado de forma satisfactoria",
          });
        }
      } else {
        res.status(400).json({
          valid: false,
          title: "Error",
          message:
            "La contraseña no posee los requisitos establecidos por el sistema",
        });
      }
    }
  } catch (error) {
    next(error);
  }
};

const request_password_change_first_login = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let { id, password } = req.body;

  try {
    let userAdmin = await getRepository(AdminUser)
      .createQueryBuilder("adminUser")
      .select(["username", "password"])
      .where("id = :id", { id: decrypt(id) })
      .andWhere("first_login = :firstLogin", { firstLogin: 1 })
      .getRawOne();

    if (userAdmin) {
      if (password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,25}$/)) {
        let updatePassword = await getConnection()
          .createQueryBuilder()
          .update(AdminUser)
          .set({
            password: () => `SHA('${password}')`,
            first_login: 0,
          })
          .where("id = :id", { id: decrypt(id) })
          .execute();

        if (updatePassword) {
          res.status(200).json({
            valid: true,
            title: "Contraseña Cambiada Exitosamente",
            message: "La contraseña se ha cambiado de forma satisfactoria",
          });
        }
      } else {
        res.status(400).json({
          valid: false,
          title: "Error",
          message:
            "La contraseña no posee los requisitos establecidos por el sistema",
        });
      }
    }
  } catch (error) {
    next(error);
  }
};

const insert_user = async (req: Request, res: Response, next: NextFunction) => {
  let { name, email, password } = req.body;

  try {
    let validateUserrep = getRepository(AdminUser);
    let validateUser = await validateUserrep.findOne({
      where: { username: name, user_email: email },
    });

    if (!validateUser) {
      if (password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,25}$/)) {
        let inserUser = await getConnection()
          .createQueryBuilder()
          .insert()
          .into(AdminUser)
          .values([
            {
              username: name,
              user_email: email,
              password: () => `SHA('${password}')`,
              restore_code: "",
              active: 1,
              first_login: 1,
              role: 1,
            },
          ])
          .execute();

        if (inserUser) {
          res.status(200).json({
            valid: true,
            title: "Usuario Creado Exitosamente",
            message: "El usuario se ha creado de forma satisfactoria",
          });
        }
      } else {
        res.status(400).json({
          valid: false,
          title: "Error",
          message:
            "La contraseña no posee los requisitos establecidos por el sistema",
        });
      }
    } else {
      res.status(400).json({
        valid: false,
        title: "Error",
        message: "Ya existe un usuario con el correo o usuario proporcionado",
      });
    }
  } catch (error) {
    next(error);
  }
};

const get_users = async (req: Request, res: Response, next: NextFunction) => {
  let { search_word, sort_order, sort_ascendent, current_offset, view_length } =
    req.query;

  try {
    let userList: any = getRepository(AdminUser)
      .createQueryBuilder()
      .select(["id", "username", "user_email"]);

    if (search_word) {
      userList = userList
        .where("username LIKE :username", { username: `%${search_word}%` })
        .orWhere("user_email LIKE :user_email", {
          user_email: `%${search_word}%`,
        });
    }

    if (sort_order && sort_ascendent) {
      userList = userList.orderBy(
        sort_order + "",
        sort_ascendent == "true" ? "ASC" : "DESC"
      );
    }

    userList = userList
      .offset(parseInt(current_offset + ""))
      .limit(parseInt(view_length + ""));

    // Do query
    userList = await userList.getRawMany();

    if (userList) {
      res.status(200).json({
        list: userList,
        count: userList.length,
      });
    }
  } catch (error) {
    next(error);
  }
};

const update_user = async (req: Request, res: Response, next: NextFunction) => {
  let { id, email } = req.body;

  try {
    let validateDuplicateEmial = await getRepository(AdminUser)
      .createQueryBuilder()
      .select(["username"])
      .where("user_email = :user_email", { email })
      .andWhere("id = :id", { id })
      .getRawOne();

    if (!validateDuplicateEmial) {
      let updateUser = await getConnection()
        .createQueryBuilder()
        .update(AdminUser)
        .set({
          user_email: email,
        })
        .where("id = :id", { id });

      if (updateUser) {
        res.status(200).json({
          title: "Usuario Editado Exitosamente",
          message: "El usuario se ha editado en el sistema",
        });
      }
    } else {
      res.status(400).json({
        valid: false,
        title: "Error",
        message: "Ya existe un usuario con el correo proporcionado",
      });
    }
  } catch (error) {
    next(error);
  }
};

var transporter = nodemailer.createTransport({
  host: "mail.privateemail.com",
  port: 587,
  secure: false,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASSWORD,
  },
});

//########################################################################
//UTILS ##################################################################
function generate_recovery_code(size) {
  var result = "";
  var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  for (var i = 0; i < size; i++) {
    result += characters.charAt(Math.floor(Math.random() * characters.length));
  }
  return result;
}

function encrypt(text) {
  var cipher = crypto.createCipheriv(algorithm, Buffer.from(key), iv);
  var crypted = cipher.update(text, "utf8", "hex");
  crypted += cipher.final("hex");
  return crypted;
}

function decrypt(text) {
  var decipher = crypto.createDecipheriv(algorithm, Buffer.from(key), iv);
  var dec = decipher.update(text, "hex", "utf8");
  dec += decipher.final("utf8");
  return dec;
}

//UTILS ##################################################################
//########################################################################

export const loginAdminUser = {
  login,
  request_recovery_code,
  validate_recovery_code,
  request_password_change,
  request_password_change_first_login,
  insert_user,
  get_users,
  update_user,
};
