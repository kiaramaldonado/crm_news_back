const selectAll = () => {
    return db.query('select * from articles');
}

const selectAllPublished = () => {
    return db.query('select * from articles where status = "publicado"');
}

// const selectById = (articleId) => {
//     return db.query('select * from articles where id = ?', [articleId]);
// }

const selectById = (articleId) => {
    return db.query('select a.*, i.url, i.caption, i.source from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id where ai.article_id = ?', [articleId]);
}

const selectByUser = (userId) => {
    return db.query('select a.author_name, a.title, a.excerpt, a.body, a.tags, a.creation_date, ua.actual_status from users_has_articles as ua join articles as a on a.id = ua.articles_id where ua.user_id = ?', [userId]);
}

const selectByCategory = (category) => {
    return db.query('select a.*, c.name from categories as c join articles as a on a.category_id = c.id where c.name = ?', [category]);
}

const selectAllCategories = () => {
    return db.query('select * from categories');
}

const insert = ({ author_name, title, excerpt, body, tags, status = 'borrador', category_id, creator_id }) => {
    return db.query('insert into articles (author_name, title, excerpt, body, tags, status, category_id, creator_id) values (?,?,?,?,?,?,?,?)', [author_name, title, excerpt, body, tags, status, category_id, creator_id]);
}

const insertImage = ({ url, source, caption }) => {
    return db.query('insert into images (url, source, caption) values (?,?,?)', [url, source, caption]);
}

const updateArticle = (articleId, { title, excerpt, body, tags, category_id }) => {
    return db.query('update articles set title = ?, excerpt = ?, body = ?, tags = ?, category_id = ? where id = ?', [title, excerpt, body, tags, category_id, articleId]);
}

const deleteArticle = (articleId) => {
    return db.query('delete from articles where id = ?', [articleId]);
}

module.exports = { selectAll, selectById, insert, updateArticle, deleteArticle, selectByUser, selectByCategory, selectAllCategories, selectAllPublished, insertImage };
