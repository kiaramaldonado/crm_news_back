const router = require('express').Router();
const ArticlesController = require('../../controllers/articles.controller');
const { checkToken } = require('../../helpers/middlewares');

router.get('/', ArticlesController.getAllArticles);
router.get('/user', checkToken, ArticlesController.getByUser);
router.get('/categories', ArticlesController.getAllCategories);
router.get('/categories/:category', ArticlesController.getByCategory);
router.get('/published', ArticlesController.getAllPublished);
router.get('/:articleId', ArticlesController.getById);

router.post('/', checkToken, ArticlesController.createArticle);

router.put('/:articleId', checkToken, ArticlesController.updateArticle);

router.delete('/:articleId', checkToken, ArticlesController.deleteArticle);

module.exports = router;