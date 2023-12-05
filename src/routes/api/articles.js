const router = require('express').Router();
const ArticlesController = require('../../controllers/articles.controller');

router.get('/', ArticlesController.getAllArticles);
router.get('/:articleId', ArticlesController.getById);

router.post('/', ArticlesController.createArticle);

module.exports = router;