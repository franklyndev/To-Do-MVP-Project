const express = require('express');
const userController = require('../controller/userController');
const authMiddleware = require('../middleware/auth');
const authorizeAdmin = authMiddleware.authorizeAdmin;

const router = express.Router();

// Rotas públicas
router.post('/users', userController.store);
router.get('/users', authMiddleware, authorizeAdmin, userController.index);

// Rotas protegidas (requerem autenticação JWT)
router.patch('/users/:id/password', authMiddleware, userController.changePassword);
router.delete('/users/:id', authMiddleware, userController.destroy);

module.exports = router;
