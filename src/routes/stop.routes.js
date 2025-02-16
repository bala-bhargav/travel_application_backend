import express from 'express';
import { postStop,updateStop,deleteStop} from '../controller/stop.controller.js';

const router = express.Router();
router.post('/stop-post',postStop);
router.put('/updateStop',updateStop);
router.delete('/deleteStop',deleteStop);

export default router;