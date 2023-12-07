const router = require('express').Router();
const UsersController = require('../../controllers/users.controller');

router.get('/', UsersController.getAllUsers);
router.get('/role/:role', UsersController.getByRole);
router.get('/:userId', UsersController.getById);

module.exports = router;