import express from 'express';
import { postSearch } from '../controller/search.controller.js';
import { getSearch } from '../controller/search.controller.js';

const router = express.Router();
router.post('/post_search', postSearch);
router.get('/get_search', getSearch);

export default router;