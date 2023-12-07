const router = require('express').Router();
const ArticlesController = require('../../controllers/articles.controller');

router.get('/', ArticlesController.getAllArticles);
router.get('/user', ArticlesController.getByUser);
router.get('/:articleId', ArticlesController.getById);

router.post('/', ArticlesController.createArticle);

router.put('/:articleId', ArticlesController.updateArticle);

router.delete('/:articleId', ArticlesController.deleteArticle);

module.exports = router;