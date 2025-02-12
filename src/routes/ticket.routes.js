import express from 'express';
import { postTicket } from '../controller/ticket.controller.js';

const router = express.Router();

router.post('/post_ticket', postTicket);
export default router;