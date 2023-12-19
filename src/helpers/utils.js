const dayjs = require('dayjs');
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');

const createToken = (user) => {
    const payload = {
        user_id: user.id,
        user_role: user.role,
        exp: dayjs().add(5, 'years').unix()
    }
    return jwt.sign(payload, process.env.SECRET_KEY);
}

const transformTitle = (title) => {
    return title.toLowerCase().replace(/[,\s]+/g, '-').normalize("NFD").replace(/[\u0300-\u036f"'`´‘’“”:]/g, "").replace(/ñ/g, 'n');
}


// Función para enviar el correo electrónico de confirmación
function sendEmail(recipient, subject, text) {
    console.log(recipient);
    // Configuración del transporte SMTP
    const transporter = nodemailer.createTransport({
        service: "gmail",
        auth: {
            user: 'johnoliversmith302@gmail.com', // Cambia por tu usuario SMTP
            pass: 'kjnn lprp wcet wsim ' // Cambia por tu contraseña SMTP
        },
        tls: { rejectUnauthorized: false },
    });

    // Opciones del correo electrónico
    const mailOptions = {
        from: 'johnoliversmith302@gmail.com', // Cambia por tu dirección de correo electrónico
        to: recipient,
        subject: subject,
        html: text
    };

    // Enviar el correo electrónico
    const info = transporter.sendMail(mailOptions, (error, data) => {
        if (error) {
            return res.json(error);

        } else {
            return res.json(data);
        }
    });


}

module.exports = { createToken, transformTitle, sendEmail };