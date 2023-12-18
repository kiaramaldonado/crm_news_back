const router = require('express').Router();
const ArticlesController = require('../../controllers/articles.controller');
const { checkToken } = require('../../helpers/middlewares');

router.get('/', ArticlesController.getAllArticles);
router.get('/user', checkToken, ArticlesController.getByUser);
router.get('/categories', ArticlesController.getAllCategories);
router.get('/parentCategory/:idParentCategory', ArticlesController.getByParentCategories);
router.get('/categories/:category', ArticlesController.getByCategory);
router.get('/categories/id/:id', ArticlesController.getByCategoryId);
router.get('/published', ArticlesController.getAllPublished);
router.get('/status/:articleStatus', checkToken, ArticlesController.getByStatus);
router.get('/article/:slug', ArticlesController.getBySlug);
router.get('/:articleId', ArticlesController.getById);

router.post('/', checkToken, ArticlesController.createArticle);
router.post('/asign/:articleId', checkToken, ArticlesController.asignArticle);

router.put('/article/:articleSlug', checkToken, ArticlesController.updateHeadline);
router.put('/:articleId', checkToken, ArticlesController.updateArticle);

router.delete('/:articleId', checkToken, ArticlesController.deleteArticle);

module.exports = router;