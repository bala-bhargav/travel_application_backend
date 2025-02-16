import express from "express";
import { postBusOwner,updateBusOwner,deleteOwner } from "../controller/busOwner.controller.js";

const router = express.Router();
router.post("/post_busOwner", postBusOwner);
router.put("/updateBusOwner",updateBusOwner);
router.delete('/deleteOwner',deleteOwner);

export default router;