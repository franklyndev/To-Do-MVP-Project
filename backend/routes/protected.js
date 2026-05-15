const express = require('express');
const router = express.Router();
const{ authenticate, authorize } = require('../middleware/authMiddleware');
const {users} = require('../data/users');


router.get('/admin/users', authenticate, authorize, (req, res) => {
    const list = users.map(user => ({ id: user.id, username: user.username, role: user.role }));
    res.json(list);
});

module.exports = router;