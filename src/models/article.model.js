const selectAll = () => {
    return db.query('select * from articles');
}

const selectById = (articleId) => {
    return db.query('select * from articles where id = ?', [articleId]);
}

const selectByUser = (userId) => {
    return db.query('select a.author_name, a.title, a.excerpt, a.body, a.tags, a.creation_date, ua.actual_status from users_has_articles as ua join articles as a on a.id = ua.articles_id where ua.user_id = ?', [userId]);
}

const selectByCategory = (category) => {
    return db.query('select a.*, c.name from news.categories as c join news.articles as a on a.category_id = c.id where c.name = ?', [category]);
}

const selectAllCategories = () => {
    return db.query('select * from categories');
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

module.exports = { selectAll, selectById, insert, updateArticle, deleteArticle, selectByUser, selectByCategory, selectAllCategories };
