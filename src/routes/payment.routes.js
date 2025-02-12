import { postPayment } from "../controller/payment.controller.js";
import express from "express";

const router = express.Router();
router.post("/post_payment", postPayment);
export default router;