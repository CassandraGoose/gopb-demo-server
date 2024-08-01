import express from 'express';

import locations from './locations';

const router = express.Router();

router.use('/locations', locations);

export default router;
