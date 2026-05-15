const { Category, Task } = require('../models');

const tasksController = {

    async store(req, res) {
        try {
            const { title, description, completed, priority, category_id } = req.body;
            const { userId } = req.user;

            if (!title) {
                return res.status(400).json({ message: 'Título da task é obrigatório' });
            }

            if (category_id) {
                const category = await Category.findOne({
                    where: {
                        id: category_id,
                        user_id: userId
                    }
                });

                if (!category) {
                    return res.status(400).json({ message: 'Categoria inválida para este usuário' });
                }
            }

            const newTask = await Task.create({
                user_id: userId,
                category_id,
                title,
                description,
                priority,
                completed
            });
            res.status(201).json(newTask);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async index(req, res) {
        try {
            const { userId } = req.user;
            const tasks = await Task.findAll({ where: { user_id: userId } });
            res.status(200).json(tasks);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async show(req, res) {
        try {
            const { id } = req.params;
            const { userId } = req.user;
            const task = await Task.findOne({
                where: {
                    id,
                    user_id: userId
                }
            });

            if (!task) {
                return res.status(404).json({ message: 'Task not found' });
            }

            res.status(200).json(task);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async update(req, res) {
        try {
            const { id } = req.params;
            const { title, description, completed, priority, category_id } = req.body;
            const { userId } = req.user;
            const task = await Task.findOne({
                where: {
                    id,
                    user_id: userId
                }
            });
            if (!task) {
                return res.status(404).json({ message: 'Task not found' });
            }

            if (category_id) {
                const category = await Category.findOne({
                    where: {
                        id: category_id,
                        user_id: userId
                    }
                });

                if (!category) {
                    return res.status(400).json({ message: 'Categoria inválida para este usuário' });
                }
            }

            await task.update({ title, description, completed, priority, category_id });
            res.status(200).json(task);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async destroy(req, res) {
        try {
            const { id } = req.params;
            const { userId } = req.user;
            const task = await Task.findOne({
                where: {
                    id,
                    user_id: userId
                }
            });
            if (!task) {
                return res.status(404).json({ message: 'Task not found' });
            }
            await task.destroy();
            res.status(200).json({ message: 'Task deleted successfully' });
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    }

};

module.exports = tasksController;
