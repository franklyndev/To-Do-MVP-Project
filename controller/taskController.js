const {taks } = require('../models');

const tasksController = {

    taskCreate(req, res) {
        try {
            const { title, description, status, completed, priority } = req.body;
            const newTask = Task.create({
                title,
                description,
                priority,
                completed,
                status
            });
            res.status(201).json(newTask);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    taskList(req, res) {
        try {
            const tasks = Task.findAll();
            res.status(200).json(tasks);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    taskUpdate(req, res) {
        try {
            const { id } = req.params;
            const { title, description, status, priority } = req.body;
            const task = Task.findByPk(id);
            if (!task) {
                return res.status(404).json({ message: 'Task not found' });
            }
            await task.update({ title, description, status, priority });
            res.status(200).json(task);
        } catch (error) {
            res.status(500).json({ message: error.message });
        }
    },

    taskDelete(req, res) {
        try {
            const { id } = req.params;
            const task = Task.findByPk(id);
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