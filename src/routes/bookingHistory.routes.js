import express from 'express';

import  {postHistory,deleteBookingHistory} from '../controller/bookingHistory.controller.js';

const router = express.Router();
router.post('/history', postHistory);
router.delete('/deleteBookingHistory',deleteBookingHistory);
export default router;