const router = require('express').Router();

router.use('/articles', require('./api/articles'));

module.exports = router;