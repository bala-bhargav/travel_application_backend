import express from 'express';
import { postSeat } from '../controller/seat.controller.js';

const router = express.Router();

router.post('/post_seat', postSeat);
export default router;