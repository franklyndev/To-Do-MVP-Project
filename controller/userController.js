const { User } = require('../models');
const bcrypt = require('bcrypt');

const userController = {
    
    async store(req, res) {
        try {
            const { name, email, password } = req.body;

            if (!name || !email || !password) {
                return res.status(400).json({ message: 'Nome, email e senha são obrigatórios' });
            }

            if (password.length < 6) {
                return res.status(400).json({ message: 'A senha deve ter no mínimo 6 caracteres' });
            }

            const userAlreadyExists = await User.findOne({ where: { email } });

            if (userAlreadyExists) {
                return res.status(409).json({ message: 'Email já cadastrado' });
            }

            const hashedPassword = await bcrypt.hash(password, 10);
            const newUser = await User.create({
                name,
                email,
                password: hashedPassword
            });

            res.status(201).json({
                id: newUser.id,
                name: newUser.name,
                email: newUser.email,
                createdAt: newUser.createdAt,
                updatedAt: newUser.updatedAt
            });
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async index(req, res) {
        try {
            const users = await User.findAll({
                attributes: { exclude: ['password'] }
            });
            res.status(200).json(users);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async changePassword(req, res) {
        try {
            const { userId } = req.user;
            const { newPassword } = req.body;

            if (!newPassword || newPassword.trim().length === 0) {
                return res.status(400).json({ message: 'Nova senha é obrigatória' });
            }

            if (newPassword.length < 6) {
                return res.status(400).json({ message: 'A senha deve ter no mínimo 6 caracteres' });
            }

            const userRecord = await User.findByPk(userId);

            if (!userRecord) {
                return res.status(404).json({ message: 'Usuário não encontrado' });
            }

            const hashedPassword = await bcrypt.hash(newPassword, 10);
            await userRecord.update({ password: hashedPassword });

            res.status(200).json({ message: 'Senha alterada com sucesso' });
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async destroy(req, res) {
        try {
            const { userId } = req.user;
            const { password } = req.body;

            if (!password) {
                return res.status(400).json({ message: 'Senha é obrigatória para confirmar exclusão' });
            }

            const userRecord = await User.findByPk(userId);

            if (!userRecord) {
                return res.status(404).json({ message: 'Usuário não encontrado' });
            }

            const passwordMatch = await bcrypt.compare(password, userRecord.password);

            if (!passwordMatch) {
                return res.status(401).json({ message: 'Senha incorreta' });
            }

            await userRecord.destroy();

            res.status(200).json({ message: 'Usuário deletado com sucesso' });
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    }

};

module.exports = userController;
