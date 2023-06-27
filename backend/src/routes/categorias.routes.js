//importamos el enrutador
import { Router } from "express";
//importamos el controlador de categorias
import { methodsHTTP as categoriaController } from "../controllers/categoria.controllers.js";

//Almacenamos el enturador en una constante para poderlo exportarlo y utilizarlo
const router = Router();

//Definicion de una ruta utilizando el metodo GET
router.get("/", categoriaController.getCategorias);
//Definicion de una ruta para agregar categorias utilizando el metodo POST
router.post("/", categoriaController.addCategorias);

//exportamos la constante para poder usarla desde otros modulos
export default router;
