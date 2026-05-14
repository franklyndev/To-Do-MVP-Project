const express = require('express');
const {
    categoryCreate,
    categoryList,
    categoryFindById,
    categoryUpdate,
    categoryDelete
} = require('../controller/categoryController');

const router = express.Router();

router.post('/categories', categoryCreate);
router.get('/categories', categoryList);
router.get('/categories/:id', categoryFindById);
router.patch('/categories/:id', categoryUpdate);
router.delete('/categories/:id', categoryDelete);

module.exports = router;
