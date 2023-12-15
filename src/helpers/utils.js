const dayjs = require('dayjs');
const jwt = require('jsonwebtoken');

const createToken = (user) => {
    const payload = {
        user_id: user.id,
        user_role: user.role,
        exp: dayjs().add(5, 'years').unix()
    }
    return jwt.sign(payload, process.env.SECRET_KEY);
}

const transformTitle = (title) => {
    return title.toLowerCase().replace(/[,\s]+/g, '-').normalize("NFD").replace(/[\u0300-\u036f"'`´‘’“”:]/g, "").replace(/ñ/g, 'n');
}

module.exports = { createToken, transformTitle };