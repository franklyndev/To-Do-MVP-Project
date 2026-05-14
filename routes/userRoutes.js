const express = require('express');
const { userCreate, userFindAll, changePassword, deleteUser } = require('../controller/userController');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

// Rotas públicas
router.post('/users', userCreate);
router.get('/users', userFindAll);

// Rotas protegidas (requerem autenticação JWT)
router.patch('/users/:id/password', authMiddleware, changePassword);
router.delete('/users/:id', authMiddleware, deleteUser);

module.exports = router;
