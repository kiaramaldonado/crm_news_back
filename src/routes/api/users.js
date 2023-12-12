const router = require('express').Router();
const UsersController = require('../../controllers/users.controller');
const { checkToken } = require('../../helpers/middlewares')

router.get('/', UsersController.getAllUsers);
router.get('/role/:role', UsersController.getByRole);
router.get('/profile', checkToken, UsersController.getById);

router.post('/', UsersController.createUser);
router.post('/login', UsersController.login);

router.put('/profile', checkToken, UsersController.update);

module.exports = router;