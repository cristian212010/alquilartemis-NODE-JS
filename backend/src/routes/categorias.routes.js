//importamos el enrutador
import { Router } from "express";
//importamos el controlador de categorias
import {methodsHTTP as categoriaController} from "../controllers/categoria.controllers.js";

//Almacenamos el enturador en una constante para poderlo exportarlo y utilizarlo
const router = Router();

//
router.get("/", categoriaController.getCategorias);

//exportamos la constante para poder usarla desde otros modulos
export default router;
