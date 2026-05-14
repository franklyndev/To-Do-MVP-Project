const express = require('express');
const {
    taskCreate,
    taskList,
    taskFindById,
    taskUpdate,
    taskDelete
} = require('../controller/taskController');

const router = express.Router();

router.post('/tasks', taskCreate);
router.get('/tasks', taskList);
router.get('/tasks/:id', taskFindById);
router.patch('/tasks/:id', taskUpdate);
router.delete('/tasks/:id', taskDelete);

module.exports = router;
