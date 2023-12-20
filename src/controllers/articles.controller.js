const ArticleModel = require('../models/article.model');
const { transformTitle, sendEmail } = require('../helpers/utils');
const SubscribersModel = require('../models/subscriber.model');


const getAllArticles = async (req, res) => {
    try {
        const [result] = await ArticleModel.selectAll();
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getAllPublished = async (req, res) => {
    try {
        const [result] = await ArticleModel.selectAllPublished();
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
        res.json({ error: error.message });
    }
}

const getByUser = async (req, res) => {
    try {
        const [result] = await ArticleModel.selectByUser(req.user.id);
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getByStatus = async (req, res) => {
    try {
        const { articleStatus } = req.params;
        console.log(articleStatus);
        const [result] = await ArticleModel.selectByStatus(articleStatus);
        console.log(result)
        res.json(result)
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getBySlug = async (req, res) => {
    try {
        const { slug } = req.params;
        const [result] = await ArticleModel.selectBySlug(slug);
        res.json(result[0])
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getByCategory = async (req, res) => {
    try {
        const { category } = req.params;
        const [result] = await ArticleModel.selectByCategory(category);
        res.json(result)
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getByCategoryId = async (req, res) => {
    try {
        const { id } = req.params;
        const [result] = await ArticleModel.selectByCategoryId(id);
        res.json(result)
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getAllCategories = async (req, res) => {
    try {
        const [result] = await ArticleModel.selectAllCategories();
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getByParentCategories = async (req, res) => {
    try {
        const { idParentCategory } = req.params;
        const [result] = await ArticleModel.selectByParentCategory(idParentCategory);
        res.json(result);
    } catch (error) {
        res.json(result);
    }
}

const createArticle = async (req, res) => {
    try {
        const { title, excerpt, body, status, category_id, url, source, caption } = req.body;
        const creator_id = req.user.id;
        const author_name = req.user.name;
        const slug = transformTitle(title);
        const [result] = await ArticleModel.insert({ author_name, title, excerpt, body, slug, status, category_id, creator_id });
        const [image] = await ArticleModel.insertImage({ url, source });
        const [articlesHasImages] = await ArticleModel.insertArticlesHasImages(image.insertId, result.insertId, { caption });
        const [usersHasArticles] = await ArticleModel.insertUsersHasArticles(creator_id, result.insertId)
        const [article] = await ArticleModel.selectById(result.insertId);
        res.json(article[0]);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const asignArticle = async (req, res) => {
    try {
        const { user_id, comments, actual_status, headline } = req.body;
        const { articleId } = req.params;
        const [nuevoRegistro] = await ArticleModel.insertUsersHasArticles(user_id, articleId, comments, actual_status);
        const [article] = await ArticleModel.selectById(articleId);
        const [statusArticle] = await ArticleModel.updateStatusArticle(articleId, { status: actual_status, headline });
        const title = article[0].title;
        const link = `http://localhost:4200/articulo/${article[0].slug}`

        console.log(actual_status, statusArticle);
        if (actual_status === "publicado") {
            try {
                const [subscribers] = await SubscribersModel.selectAll();
                const emails = await subscribers.map(subscriber => subscriber.email)
                console.log(emails);
                for (email of emails) {
                    sendEmail(email, 'Novedades en Guirre Noticiero', `<p>Hemos publicado un nuevo artículo, visita nuestra página para descubrirlo: <a href=${link}>${title}</a>.</p>`);
                }

            } catch (error) {

                console.log(error);
            }

        }

        res.json(article);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const updateArticle = async (req, res) => {
    try {
        const { articleId } = req.params;
        const { title, excerpt, body, category_id, url, source, caption } = req.body;
        const slug = transformTitle(title);
        const [result] = await ArticleModel.updateArticle(articleId, { title, excerpt, body, slug, category_id, url, source, caption });
        const [article] = await ArticleModel.selectById(articleId);
        res.json(article[0]);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const updateHeadline = async (req, res) => {
    try {
        const { articleSlug } = req.params;
        const { headline } = req.body;
        const [result] = await ArticleModel.updateFalseHeadline(articleSlug, { headline });
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const deleteArticle = async (req, res) => {
    try {
        const { articleId } = req.params;
        const [article] = await ArticleModel.selectById(articleId);
        await ArticleModel.deleteArticle(articleId);
        res.json(article[0]);
    } catch (error) {
        res.json({ error: error.message });
    }
}

module.exports = {
    getAllArticles,
    getById,
    getByUser,
    getByCategory,
    getByCategoryId,
    getAllCategories,
    getByParentCategories,
    getAllPublished,
    getByStatus,
    getBySlug,
    createArticle,
    asignArticle,
    updateArticle,
    updateHeadline,
    deleteArticle
};