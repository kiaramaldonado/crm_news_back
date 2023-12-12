const selectAll = () => {
    return db.query('select * from articles');
}

const selectAllPublished = () => {
    return db.query('select a.*, i.url, i.source, ai.caption from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id where a.status = "publicado"');
}

// const selectById = (articleId) => {
//     return db.query('select * from articles where id = ?', [articleId]);
// }

const selectById = (articleId) => {
    return db.query('select a.*, i.url, i.source, ai.caption from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id where ai.article_id = ?', [articleId]);
}

const selectByUser = (userId) => {
    return db.query('select a.author_name, a.title, a.excerpt, a.body, a.tags, a.creation_date, i.url, ai.caption, i.source, ua.actual_status from users_has_articles as ua join articles as a on a.id = ua.articles_id join articles_has_images as ai on ai.article_id = a.id join images as i on i.id = ai.image_id where ua.user_id = ?', [userId]);
}

const selectByCategory = (category) => {
    return db.query('select a.*, i.url, ai.caption, i.source, c.name from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id join categories as c on c.id = a.category_id where c.name = ?', [category]);
}

const selectAllCategories = () => {
    return db.query('select * from categories');
}

const insert = ({ author_name, title, excerpt, body, tags, status = 'borrador', category_id, creator_id }) => {
    return db.query('insert into articles (author_name, title, excerpt, body, tags, status, category_id, creator_id) values (?,?,?,?,?,?,?,?)', [author_name, title, excerpt, body, tags, status, category_id, creator_id]);
}

const insertImage = ({ url, source }) => {
    return db.query('insert into images (url, source) values (?,?)', [url, source]);
}

const insertArticlesHasImages = (imageId, articleId, { caption }) => {
    return db.query('insert into articles_has_images (image_id, article_id, caption) values (?,?,?)', [imageId, articleId, caption]);
}

const updateArticle = (articleId, { title, excerpt, body, tags, category_id }) => {
    return db.query('update articles set title = ?, excerpt = ?, body = ?, tags = ?, category_id = ? where id = ?', [title, excerpt, body, tags, category_id, articleId]);
}

// const updateArticle = (articleId, { title, excerpt, body, tags, category_id, url, source, caption }) => {
//     return db.query('update articles join articles_has_images as ai on ai.article_id = articles.id join images on ai.image_id = images.id set articles.title = ?, articles.excerpt = ?, articles.body = ?, articles.tags = ?, articles.category_id = ?, images.url = ?, images.source = ?, images.caption = ? WHERE articles.id = ?', [title, excerpt, body, tags, category_id, url, source, caption, articleId]);
// }

const deleteArticle = (articleId) => {
    return db.query('delete from articles where id = ?', [articleId]);
}

module.exports = { selectAll, selectById, insert, updateArticle, deleteArticle, selectByUser, selectByCategory, selectAllCategories, selectAllPublished, insertImage, insertArticlesHasImages };
