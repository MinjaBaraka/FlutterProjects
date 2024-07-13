
import jwt from 'jsonwebtoken';

import dotenv from 'dotenv';

// Load environment variables from .env file
dotenv.config();

const secret_Key = process.env.SECRET_KEY;

const createAuthToken = (user) => {
    const token = jwt.sign({ id: user.id, email: user.email }, secret_Key, { expiresIn: '1h' });
    return token;
}

const createRequestToken = () => {
    var chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var result = '';
    for (let i = 20; i > 0; i--) {
        result += chars[Math.floor(Math.random() * chars.length)];
    }
    return result;
}

const createOTP = (length = 4) => {
    var chars = "0123456789";
    var result = '';
    for (let i = length; i > 0; i--) {
        result += chars[Math.floor(Math.random() * chars.length)];
    }
    return result;
}


export {
    createRequestToken,
    createAuthToken,
    createOTP
}