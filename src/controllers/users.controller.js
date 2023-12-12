const bcrypt = require('bcryptjs');
const UserModel = require('../models/user.model');
const { createToken } = require('../helpers/utils');

const getAllUsers = async (req, res) => {
    try {
        const [result] = await UserModel.selectAll();
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getById = async (req, res) => {
    try {
        const userId = req.user.id;
        const [result] = await UserModel.selectById(userId);
        if (result.length === 0) return res.json({ error: 'EL ID del usuario no existe.' });
        res.json(result[0]);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getByRole = async (req, res) => {
    try {
        const { role } = req.params;
        const [result] = await UserModel.selectByRole(role);
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const createUser = async (req, res) => {
    try {
        req.body.password = bcrypt.hashSync(req.body.password, 8);
        const [result] = await UserModel.insert(req.body);
        const [user] = await UserModel.selectById(result.insertId);
        res.json(user[0]);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const login = async (req, res) => {
    const { email, password } = req.body;
    try {
        const [result] = await UserModel.selectByEmail(email);
        if (result.length === 0) {
            return res.json({ error: 'Los datos introducidos no son correctos.' });
        }
        const user = result[0];

        const comparation = bcrypt.compareSync(password, user.password);
        if (!comparation) {
            return res.json({ error: 'Los datos introducidos no son correctos.' });
        }
        res.json({
            success: 'Login correcto.',
            token: createToken(user)
        });

    } catch (error) {
        res.json({ error: error.message });
    }
}

const update = async (req, res) => {
    try {
        const userId = req.user.id;
        const [result] = await UserModel.update(userId, req.body);
        const [user] = await UserModel.selectById(userId);
        res.json(user[0]);
    } catch (error) {
        res.json({ error: error.message });
    }
}

module.exports = { getAllUsers, getByRole, getById, createUser, login, update };

