const selectAll = () => {
    return db.query('select * from articles');
}

const selectById = (articleId) => {
    return db.query('select * from articles where id = ?', [articleId]);
}

const insert = ({ author_name, title, excerpt, body, tags, status = 'borrador', category_id }) => {
    return db.query('insert into articles (author_name, title, excerpt, body, tags, status, category_id) values (?,?,?,?,?,?,?)', [author_name, title, excerpt, body, tags, status, category_id]);
}

const updateArticle = (articleId, { title, excerpt, body, tags, category_id }) => {
    return db.query('update articles set title = ?, excerpt = ?, body = ?, tags = ?, category_id = ? where id = ?', [title, excerpt, body, tags, category_id, articleId]);
}

const deleteArticle = (articleId) => {
    return db.query('delete from articles where id = ?', [articleId]);
}

module.exports = { selectAll, selectById, insert, updateArticle, deleteArticle };
