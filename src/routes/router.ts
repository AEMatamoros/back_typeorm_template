import { Router } from "express";
import { verifyTokenAdmin } from "../controllers/verifyTokenAdmin";

import { loginAdminUser } from "../controllers/loginAdminUser";

//Admin

export const router = Router();

//AUTH ###################################################################
router.get("/login", loginAdminUser.login);

router.post("/request_recovery_code", loginAdminUser.request_recovery_code);

router.get("/validate_recovery_code", loginAdminUser.validate_recovery_code);

router.post("/request_password_change", loginAdminUser.request_password_change);

router.post(
  "/request_password_change_first_login",
  loginAdminUser.request_password_change_first_login
);

router.post("/insert_user", verifyTokenAdmin, loginAdminUser.insert_user);

router.get("/get_users", verifyTokenAdmin, loginAdminUser.get_users);

router.put("/update_user", verifyTokenAdmin, loginAdminUser.update_user);
