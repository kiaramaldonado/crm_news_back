const router = require('express').Router();
const ImageController = require('../../controllers/images.controller')


router.get('/:page', ImageController.getAllImages);
router.get('/:imageId', ImageController.getImageById)


module.exports = router;