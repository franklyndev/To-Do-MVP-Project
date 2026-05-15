const { Category } = require('../models');

const categoryController = {
    async store(req, res) {
        try {
            const { name } = req.body;
            const { userId } = req.user;

            if (!name) {
                return res.status(400).json({ message: 'Nome da categoria é obrigatório' });
            }

            const newCategory = await Category.create({
                name,
                user_id: userId
            });

            res.status(201).json(newCategory);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async index(req, res) {
        try {
            const { userId } = req.user;
            const categories = await Category.findAll({ where: { user_id: userId } });
            res.status(200).json(categories);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async show(req, res) {
        try {
            const { id } = req.params;
            const { userId } = req.user;
            const category = await Category.findOne({
                where: {
                    id,
                    user_id: userId
                }
            });

            if (!category) {
                return res.status(404).json({ message: 'Categoria não encontrada' });
            }

            res.status(200).json(category);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async update(req, res) {
        try {
            const { id } = req.params;
            const { name } = req.body;
            const { userId } = req.user;
            const category = await Category.findOne({
                where: {
                    id,
                    user_id: userId
                }
            });

            if (!category) {
                return res.status(404).json({ message: 'Categoria não encontrada' });
            }

            await category.update({ name });
            res.status(200).json(category);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async destroy(req, res) {
        try {
            const { id } = req.params;
            const { userId } = req.user;
            const category = await Category.findOne({
                where: {
                    id,
                    user_id: userId
                }
            });

            if (!category) {
                return res.status(404).json({ message: 'Categoria não encontrada' });
            }

            await category.destroy();
            res.status(200).json({ message: 'Categoria deletada com sucesso' });
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    }
};

module.exports = categoryController;
