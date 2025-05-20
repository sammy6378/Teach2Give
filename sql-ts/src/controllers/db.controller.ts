import { pool,executeQuery } from "../utils/db";
import { Request, Response } from "express";

// Get all tables
export const getAllTables = async (req:Request, res:Response) => {
  try {
    const result = await executeQuery(
      "SELECT table_name FROM information_schema.tables WHERE table_schema='public'"
    );
    res.status(200).json(result);
  } catch (error) {
    console.error("Error fetching tables:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// get data from a table
export const getTableData = async (req:Request, res:Response) => {
  const tableName = req.params.tableName;
  try {
    const result = await executeQuery(`SELECT * FROM ${tableName}`);
    res.status(200).json(result);
  } catch (error) {
    console.error("Error fetching table data:", error);
    res.status(500).json({ error: "Internal server error" });
  }
}