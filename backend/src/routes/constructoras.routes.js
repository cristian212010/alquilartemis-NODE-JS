import { Router } from "express";
import { methodsHTTP as constructorasRoutes } from "../controllers/constructora.controllers.js";

const router = Router();

router.get("/", constructorasRoutes.getConstructoras);
router.post("/", constructorasRoutes.addConstructoras);

export default router;
