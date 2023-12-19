const router = require('express').Router();
const SubscribersController = require('../../controllers/subscribers.controller');

router.get('/', SubscribersController.getAllSubscribers);
router.post('/', SubscribersController.subscribe);
router.post('/newsletter', SubscribersController.sendNews);

module.exports = router;