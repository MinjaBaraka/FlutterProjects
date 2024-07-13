import { Router } from 'express';
import upload from '../services/imageServices.js';
import { loginUser, registerUser, resetPassword, updateUserInfo } from '../controllers/userController.js';

const router = Router();

router.post('/register', upload.single('imageFile'), registerUser);

router.post('/login', loginUser);

router.post('/reset-password', resetPassword);

router.put('/updateUserInfo/:id', updateUserInfo);

export default router;
