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

const sendNews = async (req, res) => {
    try {
        const [subscribers] = await SubscribersModel.selectAll();
        const emails = await subscribers.map(subscriber => subscriber.email)
        console.log(emails);
        for (email of emails) {
            sendEmail(email, 'prueba', 'prueba 2');
        }
        res.json({ success: true, message: 'Correos enviados exitosamente' });
    } catch (error) {
        res.json({ error: error.message });
    }
}



module.exports = { getAllSubscribers, subscribe, sendNews };