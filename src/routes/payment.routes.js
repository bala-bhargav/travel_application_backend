import { postPayment,updatedPayment,deletePayment } from "../controller/payment.controller.js";
import express from "express";

const router = express.Router();
router.post("/post_payment", postPayment);
router.put("/updatedPayment",updatedPayment);
router.delete('/deletePayment',deletePayment);
export default router;