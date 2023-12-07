const selectAll = () => {
    return db.query('select * from users');
}

const selectById = (userId) => {
    return db.query('select * from users where id = ?', [userId]);
}

const selectByRole = (role) => {
    return db.query('select * from users where role = ?', [role]);
}

const insert = ({ name, username, email, password, role = 'redactor', date_of_birth, phone, image }) => {
    return db.query('insert into users (name, username, email, password, role, date_of_birth, phone, image) values (?, ?, ?, ?, ?, ?, ?, ?)', [name, username, email, password, role, date_of_birth, phone, image]);
}

module.exports = { selectAll, selectByRole, insert, selectById };
