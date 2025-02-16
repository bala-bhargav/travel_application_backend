import express from 'express';

import { postBus,updateBus,deleteBus } from '../controller/bus.controller.js';

const router = express.Router();
router.post('/post_bus', postBus);
router.put('/updateBus',updateBus);
router.delete('/deleteBus',deleteBus);

export default router;