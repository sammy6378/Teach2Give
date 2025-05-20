import { createUser, getOneUser } from "../controllers/user.controller";
import { Router } from "express";


export const userRouter = Router();

// create a new user
userRouter.post("/create-user", createUser);
// get one user
userRouter.get("/get-user/:id",getOneUser);