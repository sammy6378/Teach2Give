import { executeQuery } from "../utils/db";
import { TUser } from "../utils/types";
import validator from "validator";
import bcrypt from "bcryptjs";
import { Request, Response} from "express";

export const createUser = async (req: Request, res: Response): Promise<void> => {
  try {
    const { full_name, email, age, password, gender } = req.body as TUser;

    // Validate email
    if (!validator.isEmail(email)) {
      res.status(400).json({ error: "Invalid email address" });
      return; 
    }

    // Validate password strength
    if (!validator.isStrongPassword(password)) {
      res.status(400).json({ error: "Password is not strong enough" });
      return;
    }

    // Validate age
    if (!validator.isInt(age.toString(), { min: 18, max: 100 })) {
      res.status(400).json({ error: "Age must be between 18 and 100" });
      return;
    }

    // Check if email already exists
    const existingUser = await executeQuery(
      `SELECT * FROM users WHERE email = $1`,
      [email.trim()]
    );

    if (existingUser.length > 0) {
      res.status(409).json({ error: "Email already exists" });
      return; 
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user into the database
    const result = await executeQuery(
      `INSERT INTO users (full_name, email, age, password, gender) VALUES ($1, $2, $3, $4, $5) RETURNING id`,
      [full_name.trim(), email.trim(), age, hashedPassword, gender]
    );

    const userId = result[0].id;

    // Respond with success and the new user's ID
    res.status(201).json({
      message: "User created successfully",
      user: {
        id: userId,
        full_name,
        email,
        age,
        gender
      }
    });

  } catch (error: any) {
    console.error("Error creating user:", error.message);
    res.status(500).json({ error: "Internal server error" });
  }
};
