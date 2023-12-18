const selectAll = () => {
    return db.query('select * from articles');
}

const selectAllPublished = () => {
    return db.query('select a.*, i.url, i.source, ai.caption from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id where a.status = "publicado"');
}

const selectById = (articleId) => {
    return db.query('select a.*, i.url, i.source, ai.caption from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id where ai.article_id = ?', [articleId]);
}

const selectByStatus = (articleStatus) => {
    return db.query('select a.*, i.url, i.source, ai.caption from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id where a.status = ?', [articleStatus]);
}

const selectBySlug = (slug) => {
    return db.query('select a.*, i.url, i.source, ai.caption from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id where a.slug = ?', [slug]);
}

const selectByUser = (userId) => {
    return db.query('select a.*, i.url, ai.caption, i.source, ua.actual_status, ua.assignment_date from users_has_articles as ua join articles as a on a.id = ua.articles_id join articles_has_images as ai on ai.article_id = a.id join images as i on i.id = ai.image_id where ua.user_id = ?', [userId]);
}

const selectByCategory = (category) => {
    return db.query('select a.*, i.url, ai.caption, i.source, c.name from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id join categories as c on c.id = a.category_id where c.name = ? and a.status = "publicado"', [category]);
}

const selectByCategoryId = (id) => {
    return db.query('select a.*, i.url, ai.caption, i.source, c.name from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id join categories as c on c.id = a.category_id where (c.id = ? and a.status = "publicado") or (c.parent_id = ? and a.status = "publicado")', [id, id]);
}

const selectAllCategories = () => {
    return db.query('select * from categories');
}

const selectByParentCategory = (idParentCategory) => {
    return db.query('select a.*, i.url, ai.caption, i.source, c.parent_id, c.id from articles_has_images as ai join articles as a on a.id = ai.article_id join images as i on i.id = ai.image_id join categories as c on c.id = a.category_id where c.parent_id = ?', [idParentCategory])
}

const insert = ({ author_name, title, excerpt, body, slug, status = 'borrador', category_id, creator_id }) => {
    return db.query('insert into articles (author_name, title, excerpt, body, slug, status, category_id, creator_id) values (?,?,?,?,?,?,?,?)', [author_name, title, excerpt, body, slug, status, category_id, creator_id]);
}

const insertImage = ({ url, source }) => {
    return db.query('insert into images (url, source) values (?,?)', [url, source]);
}

const insertArticlesHasImages = (imageId, articleId, { caption }) => {
    return db.query('insert into articles_has_images (image_id, article_id, caption) values (?,?,?)', [imageId, articleId, caption]);
}

const insertUsersHasArticles = (user_id, articles_id, comments, actual_status = 'borrador') => {
    return db.query('insert into news.users_has_articles (user_id, articles_id, comments, actual_status) values (?, ?, ?, ?)', [user_id, articles_id, comments, actual_status])
}

const updateArticle = (articleId, { title, excerpt, body, slug, category_id }) => {
    return db.query('update articles set title = ?, excerpt = ?, body = ?, slug = ?, category_id = ? where id = ?', [title, excerpt, body, slug, category_id, articleId]);
}

const updateStatusArticle = (articleId, { status, headline = 0 }) => {
    return db.query('update articles set status = ?, headline = ? where id = ?', [status, headline, articleId]);
}

const updateFalseHeadline = (articleSlug, { headline = 0 }) => {
    return db.query('update articles set headline = 0 where slug = ?', [articleSlug]);
}

const deleteArticle = (articleId) => {
    return db.query('delete from articles where id = ?', [articleId]);
}

module.exports = {
    selectAll,
    selectById,
    selectBySlug,
    selectByStatus,
    selectAllPublished,
    selectByUser,
    selectByCategory,
    selectByCategoryId,
    selectAllCategories,
    selectByParentCategory,
    insert,
    insertImage,
    insertArticlesHasImages,
    insertUsersHasArticles,
    updateArticle,
    updateStatusArticle,
    updateFalseHeadline,
    deleteArticle
};
