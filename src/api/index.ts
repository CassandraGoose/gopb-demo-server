import express from 'express';

import MessageResponse from '../interfaces/MessageResponse';
import locations from './locations';

const router = express.Router();

// /

router.use('/locations', locations);

export default router;
