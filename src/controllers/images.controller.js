const ImageModel = require('../models/image.model');

const getAllImages = async (req, res) => {
    try {
        const [result] = await ImageModel.selectAll();
        res.json(result)
        
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getAllImagesPage = async (req, res) => {
    try {
        const { page = 1, pageSize = 4 } = req.params;
        const [result] = await ImageModel.selectAll(parseInt(page), parseInt(pageSize));
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
}

const getImageById = async (req, res) => {
    try {
        const { imageId } = req.params;
        const [result] = await ImageModel.selectById(imageId);
        if (result.length === 0) return res.json({ error: 'EL ID de la imagen no existe.' });
        res.json(result[0]);
    } catch (error) {
        console.log(error);
        res.json({ error: error.message });
    }
}



module.exports = { getAllImages, getAllImagesPage, getImageById }
