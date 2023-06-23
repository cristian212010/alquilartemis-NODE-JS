import { Router } from "express";
import { methodsHTTP as empleadosRoutes } from "../controllers/empleado.controllers.js";

const router = Router();

router.get("/", empleadosRoutes.getEmpleados);

export default router;
