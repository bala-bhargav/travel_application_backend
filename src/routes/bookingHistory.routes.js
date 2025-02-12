import express from 'express';

import  {postHistory} from '../controller/bookingHistory.controller.js';

const router = express.Router();
router.post('/history', postHistory);
export default router;