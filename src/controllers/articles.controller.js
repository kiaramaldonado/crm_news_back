const ArticleModel = require('../models/article.model');

const getAllArticles = async (req, res) => {
    try {
        const [result] = await ArticleModel.selectAll();
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getById = async (req, res) => {
    try {
        const { articleId } = req.params;
        const [result] = await ArticleModel.selectById(articleId);
        if (result.length === 0) return res.json({ error: 'EL ID del artículo no existe.' });
        res.json(result[0]);
    } catch (error) {
        console.log(error);
        res.json({ fatal: error.message });
    }
}

const createArticle = async (req, res) => {
    try {
        const [result] = await ArticleModel.insert(req.body);
        const [article] = await ArticleModel.selectById(result.insertId);
        console.log(article);
        res.json(article);
    } catch (error) {
        res.json({ error: error.message });
    }
}

module.exports = { getAllArticles, createArticle, getById };