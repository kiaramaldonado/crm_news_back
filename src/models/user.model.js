const selectAll = () => {
    return db.query('select * from users');
}

const selectById = (userId) => {
    return db.query('select * from users where id = ?', [userId]);
}

const selectByRole = (role) => {
    return db.query('select * from users where role = ?', [role]);
}

const selectByEmail = (email) => {
    return db.query('select * from users where email = ?', [email]);
}

const insert = ({ name, username, email, password, role = 'redactor', date_of_birth, phone, image }) => {
    return db.query('insert into users (name, username, email, password, role, date_of_birth, phone, image) values (?, ?, ?, ?, ?, ?, ?, ?)', [name, username, email, password, role, date_of_birth, phone, image]);
}

const update = (userId, { name, password, role, date_of_birth, phone, image }) => {
    return db.query('update users set name = ?, password = ?, role = ?, date_of_birth = ?, phone = ?, image = ? where id = ?', [name, password, role, date_of_birth, phone, image, userId]);
}

module.exports = { selectAll, selectByRole, insert, selectById, selectByEmail, update };
