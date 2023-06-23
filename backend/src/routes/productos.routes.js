import { Router } from "express";
import { methodsHTTP as productosRoutes } from "../controllers/producto.controllers.js";

const router = Router();

router.get("/", productosRoutes.getProductos);

export default router;