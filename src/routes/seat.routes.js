import express from 'express';
import { postSeat,updateSeat,deleteSeat } from '../controller/seat.controller.js';

const router = express.Router();

router.post('/post_seat', postSeat);
router.put('/updateSeat',updateSeat);
router.delete('/deleteSeat',deleteSeat);
export default router;