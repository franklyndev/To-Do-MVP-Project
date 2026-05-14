const { Category } = require('../models');

const categoryController = {
    async categoryCreate(req, res) {
        try {
            const { name } = req.body;
            const user_id = req.user?.userId || req.body.user_id;

            if (!name) {
                return res.status(400).json({ message: 'Nome da categoria é obrigatório' });
            }

            if (!user_id) {
                return res.status(400).json({ message: 'user_id é obrigatório' });
            }

            const newCategory = await Category.create({
                name,
                user_id
            });

            res.status(201).json(newCategory);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async categoryList(req, res) {
        try {
            const categories = await Category.findAll();
            res.status(200).json(categories);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async categoryFindById(req, res) {
        try {
            const { id } = req.params;
            const category = await Category.findByPk(id);

            if (!category) {
                return res.status(404).json({ message: 'Categoria não encontrada' });
            }

            res.status(200).json(category);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async categoryUpdate(req, res) {
        try {
            const { id } = req.params;
            const { name } = req.body;
            const category = await Category.findByPk(id);

            if (!category) {
                return res.status(404).json({ message: 'Categoria não encontrada' });
            }

            await category.update({ name });
            res.status(200).json(category);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async categoryDelete(req, res) {
        try {
            const { id } = req.params;
            const category = await Category.findByPk(id);

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
