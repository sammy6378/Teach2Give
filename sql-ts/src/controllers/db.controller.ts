import { pool } from "../utils/db";
import { Request, Response } from "express";

// Get all tables
export const getAllTables = async (req:Request, res:Response) => {
  try {
    const result = await pool.query(
      "SELECT table_name FROM information_schema.tables WHERE table_schema='public'"
    );
    res.status(200).json(result.rows);
  } catch (error) {
    console.error("Error fetching tables:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};