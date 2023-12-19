const selectAll = () => {
    return db.query('select * from images');
}

const selectAllPage = (page , pageSize) => {
    const offset = (page - 1) * pageSize;
    return db.query('SELECT * FROM images LIMIT ? OFFSET ?', [pageSize, offset]);
};

const selectById = (imageId) => {
    return db.query('select * from images where id = ?', [imageId]);
}


module.exports = {selectAll, selectAllPage, selectById}