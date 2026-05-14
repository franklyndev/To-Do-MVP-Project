require('dotenv').config();

const express = require('express');
const db = require('./models');
const userRoutes = require('./routes/userRoutes');

const app = express();

// Middleware
app.use(express.json());

// Rotas
app.use('/api', userRoutes);

// Sincronizar banco de dados e iniciar servidor
const PORT = process.env.PORT || 3000;

db.sequelize.sync().then(() => {
    app.listen(PORT, () => {
        console.log(`Servidor rodando na porta ${PORT}`);
    });
}).catch(error => {
    console.error('Erro ao sincronizar banco de dados:', error);
});
