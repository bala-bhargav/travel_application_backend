import express from 'express';
import { postTicket,updateTicket,deleteTicket } from '../controller/ticket.controller.js';

const router = express.Router();

router.post('/post_ticket', postTicket);
router.put('/updateTicket',updateTicket);
router.delete('/deleteTicket',deleteTicket);
export default router;