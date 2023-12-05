const selectAll = () => {
    return db.query('select * from articles');
}

const selectById = (articleId) => {
    return db.query('select * from articles where id = ?', [articleId]);
}

const insert = ({ author_name, title, excerpt, body, tags, status = 'borrador', category_id }) => {
    return db.query('insert into articles (author_name, title, excerpt, body, tags, status, category_id) values (?,?,?,?,?,?,?)', [author_name, title, excerpt, body, tags, status, category_id]);
}

module.exports = { selectAll, selectById, insert };