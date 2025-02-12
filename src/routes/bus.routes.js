import express from 'express';

import { postBus } from '../controller/bus.controller.js';

const router = express.Router();
router.post('/post_bus', postBus);

export default router;