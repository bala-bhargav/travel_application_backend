import express from 'express';
import { postTraveller,updateTraveller,deleteTraveller } from '../controller/Traveller.controller.js';

const router = express.Router();

router.post('/post_traveller', postTraveller);
router.put('/updateTraveller',updateTraveller);
router.delete('/deleteTraveller',deleteTraveller);

export default router;