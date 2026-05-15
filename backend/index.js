require('dotenv').config();

const express = require('express');
const db = require('./models');
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const taskRoutes = require('./routes/taskRoutes');
const categoryRoutes = require('./routes/categoryRoutes');

const app = express();

// Middleware
app.use(express.json());

// Rotas
app.use('/api', authRoutes);
app.use('/api', userRoutes);
app.use('/api', taskRoutes);
app.use('/api', categoryRoutes);

// Sincronizar banco de dados e iniciar servidor
const PORT = process.env.PORT || 3000;

db.sequelize.authenticate().then(() => {
    app.listen(PORT, () => {
        console.log(`Servidor rodando na porta ${PORT}`);
    });
}).catch(error => {
    console.error('Erro ao conectar ao banco de dados:', error);
});
