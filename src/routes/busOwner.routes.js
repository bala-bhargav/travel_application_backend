import express from "express";
import { postBusOwner } from "../controller/busOwner.controller.js";

const router = express.Router();
router.post("/post_busOwner", postBusOwner);

export default router;