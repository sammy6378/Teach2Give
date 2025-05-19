import { getAllTables } from "../controllers/db.controller";

import { Router } from "express";

export const router = Router();

router.get("/tables", getAllTables);