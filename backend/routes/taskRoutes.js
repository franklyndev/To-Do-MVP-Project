const express = require('express');
const taskController = require('../controller/taskController');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

router.use(authMiddleware);

router.post('/tasks', taskController.store);
router.get('/tasks', taskController.index);
router.get('/tasks/:id', taskController.show);
router.patch('/tasks/:id', taskController.update);
router.delete('/tasks/:id', taskController.destroy);

module.exports = router;
