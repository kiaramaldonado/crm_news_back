const selectAll = () => {
    return db.query('select * from images');
}

const selectById = (imageId) => {
    return db.query('select * from images where id = ?', [imageId]);
}


module.exports = {selectAll, selectById}