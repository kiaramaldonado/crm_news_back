const { sendEmail } = require('../helpers/utils');
const SubscribersModel = require('../models/subscriber.model');


const getAllSubscribers = async (req, res) => {
    try {
        const [result] = await SubscribersModel.selectAll();
        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
};

const subscribe = async (req, res) => {
    try {
        const { email } = req.body;

        // Insertar la nueva suscripción en la base de datos
        const [result] = await SubscribersModel.insert({ email });

        // Enviar correo electrónico de confirmación
        sendEmail(email, 'Bienvenido al Newsletter de Guirre Noticiero', 'Gracias por haberte suscrito');

        res.json(result);
    } catch (error) {
        res.json({ error: error.message });
    }
};

const sendNews = async () => {
    try {
        const [subscribers] = await SubscribersModel.selectAll();
        const emails = await subscribers.map(subscriber => subscriber.email)
        console.log(emails);
        for (email of emails) {
            sendEmail(email, 'Aquí tienes el nuevo artículo publicado', '<p>Hemos publicado un nuevo artículo, visita nuestra página para descubrirlo: <a href="http://localhost:4200/guirre">Guirre</a></p>');
        }

    } catch (error) {
        console.log(error);

    }
}



module.exports = { getAllSubscribers, subscribe, sendNews };