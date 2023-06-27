import { Router } from "express";
import { methodsHTTP as productosRoutes } from "../controllers/producto.controllers.js";

const router = Router();

router.get("/", productosRoutes.getProductos);
router.post("/", productosRoutes.addProductos);

export default router;