import express from 'express';
import { postTraveller } from '../controller/Traveller.controller.js';

const router = express.Router();

router.post('/post_traveller', postTraveller);

export default router;