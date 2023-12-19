const router = require('express').Router();
const ImageController = require('../../controllers/images.controller')


router.get('/', ImageController.getAllImages);
router.get('/:page', ImageController.getAllImagesPage);
router.get('/:imageId', ImageController.getImageById)


module.exports = router;