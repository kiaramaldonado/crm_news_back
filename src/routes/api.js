const router = require('express').Router();
const { checkToken } = require('../helpers/middlewares');

router.use('/articles', checkToken, require('./api/articles'));
router.use('/users', require('./api/users'));

module.exports = router;