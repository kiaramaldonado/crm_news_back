const UserModel = require('../models/user.model');

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
        const { userId } = req.params;
        const [result] = await UserModel.selectById(userId);
        if (result.length === 0) return res.json({ error: 'EL ID del usuario no existe.' });
        res.json(result[0]);
    } catch (error) {
        res.json({ fatal: error.message });
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

    } catch (error) {

    }
}

module.exports = { getAllUsers, getByRole, getById };