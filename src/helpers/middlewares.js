const jwt = require('jsonwebtoken')
const UserModel = require('../models/user.model');

const checkToken = async (req, res, next) => {
    if (!req.headers['authorization']) {
        return res.json({ error: 'Necesitas la cabecera de Authorization.' })
    }
    const token = req.headers['authorization'];
    let payload;
    try {
        payload = jwt.verify(token, process.env.SECRET_KEY);
    } catch (error) {
        return res.json({ error: error.message });
    }
    const [result] = await UserModel.selectById(payload.user_id);
    req.user = result[0];
    next();
}

module.exports = { checkToken };
