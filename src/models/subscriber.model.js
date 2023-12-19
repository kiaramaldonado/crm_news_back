
const selectAll = () => {
    return db.query('SELECT * FROM subscribers');
};

const insert = ({ email }) => {
    return db.query('INSERT INTO subscribers (email) VALUES (?)', [email]);
};

module.exports = { selectAll, insert };