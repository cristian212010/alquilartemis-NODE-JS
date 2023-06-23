import { Router } from "express";
import { methodsHTTP as constructorasRoutes } from "../controllers/constructora.controllers.js";

const router = Router();

router.get("/", constructorasRoutes.getConstructoras);

export default router;
