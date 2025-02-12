import express from 'express';
import { postStop } from '../controller/stop.controller.js';

const router = express.Router();
router.post('/stop-post',postStop);

export default router;