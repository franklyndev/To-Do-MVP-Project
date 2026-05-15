const express = require('express');
const categoryController = require('../controller/categoryController');

const router = express.Router();

router.post('/categories', categoryController.store);
router.get('/categories', categoryController.index);
router.get('/categories/:id', categoryController.show);
router.patch('/categories/:id', categoryController.update);
router.delete('/categories/:id', categoryController.destroy);

module.exports = router;
