import { getAllTables, getTableData } from "../controllers/db.controller";

import { Router } from "express";

export const router = Router();

router.get("/tables", getAllTables);

router.get("/tables/:tableName", getTableData)