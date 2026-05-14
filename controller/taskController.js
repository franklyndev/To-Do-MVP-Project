const { Task } = require('../models');

const tasksController = {

    async taskCreate(req, res) {
        try {
            const { title, description, completed, priority, category_id } = req.body;
            const user_id = req.user?.userId || req.body.user_id;

            if (!title) {
                return res.status(400).json({ message: 'Título da task é obrigatório' });
            }

            if (!user_id) {
                return res.status(400).json({ message: 'user_id é obrigatório' });
            }

            const newTask = await Task.create({
                user_id,
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

    async taskList(req, res) {
        try {
            const tasks = await Task.findAll();
            res.status(200).json(tasks);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async taskFindById(req, res) {
        try {
            const { id } = req.params;
            const task = await Task.findByPk(id);

            if (!task) {
                return res.status(404).json({ message: 'Task not found' });
            }

            res.status(200).json(task);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async taskUpdate(req, res) {
        try {
            const { id } = req.params;
            const { title, description, completed, priority, category_id } = req.body;
            const task = await Task.findByPk(id);
            if (!task) {
                return res.status(404).json({ message: 'Task not found' });
            }
            await task.update({ title, description, completed, priority, category_id });
            res.status(200).json(task);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    async taskDelete(req, res) {
        try {
            const { id } = req.params;
            const task = await Task.findByPk(id);
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
