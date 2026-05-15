const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
    try {
        const authHeader = req.headers.authorization;

        if (!authHeader) {
            return res.status(401).json({ message: 'Token não fornecido' });
        }

        const [scheme, token] = authHeader.split(' ');

        if (scheme !== 'Bearer' || !token) {
            return res.status(401).json({ message: 'Formato do token inválido' });
        }

        const decoded = jwt.verify(token, process.env.JWT_SECRET || 'seu_segredo_jwt');

        if (!decoded.userId) {
            return res.status(401).json({ message: 'Token inválido' });
        }

        req.user = decoded;
        next();
    } catch (error) {
        if (error instanceof jwt.JsonWebTokenError) {
            return res.status(401).json({ message: 'Token inválido' });
        }
        if (error instanceof jwt.TokenExpiredError) {
            return res.status(401).json({ message: 'Token expirado' });
        }
        res.status(500).json({ message: error.message });
    }
};

module.exports = authMiddleware;
