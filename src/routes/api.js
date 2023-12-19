const router = require('express').Router();

router.use('/articles', require('./api/articles'));
router.use('/users', require('./api/users'));
router.use('/images', require('./api/images'));
router.use('/subscribers', require('./api/subscribers'));

module.exports = router;