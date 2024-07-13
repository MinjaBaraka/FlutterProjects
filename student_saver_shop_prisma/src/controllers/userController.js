import bcrypt from 'bcrypt';
import { v4 as uuidv4 } from 'uuid';
import { PrismaClient } from '@prisma/client';
import serverYYYYMMDDHHmmss from '../services/momentTimezoneService.js';
import { createAuthToken, createOTP } from '../services/OTP_TOKENService.js';

const prisma = new PrismaClient();


import africastalking from 'africastalking';

const AT = africastalking({
    apiKey: process.env.API_KEY.trim(),
    username: process.env.USER_NAME.trim()
});

const sms = AT.SMS;

// Register API
const registerUser = async (req, res) => {
    const { fullName, phoneNumber, email, studentInstitution, password } = req.body;
    const imageFile = req.file ? `/uploads/profile/${req.file.filename}` : null;

    try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // Check if the user already exists
        const existingUser = await prisma.user.findUnique({
            where: { email: email }
        });

        if (existingUser) {
            return res.status(400).json({ message: 'Email already exists' });
        }

        const auth_Token = createAuthToken({ email });
        const auth_otp = createOTP();

        // Generate UUID for user
        const userId = uuidv4();

        const newUser = await prisma.user.create({
            data: {
                uuid: userId,
                fullName,
                phoneNumber,
                email,
                studentInstitution,
                imageFile,
                password: hashedPassword,
                acceptTerms: true,
                auth_Token,
                auth_otp,
                createdAt: new Date(serverYYYYMMDDHHmmss()),
                updatedAt: new Date(serverYYYYMMDDHHmmss())
            }
        });

        const authToken = createAuthToken(newUser); // Generate JWT token
        const otp = createOTP(); // Generate OTP

        // Save OTP in database or send via SMS/Email
        // (Implementation of OTP storage or sending is not shown here)

        return res.status(201).send({
            message: "User registered successfully!",
            user: newUser,
            token: auth_Token,
            otp: auth_otp // You might want to send OTP via a different channel
        });

        // return res.status(201).send({ message: "User registered successfully!", registerUser });

    } catch (error) {
        console.error('Error during user registration:', error);
        return res.status(500).send({ message: "Error processing request", error: error.message });
    }
}


// Login API
const loginUser = async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).send({ message: "Email and password are required." });
    }

    try {
        const user = await prisma.user.findUnique({
            where: { email: email }
        });

        if (!user) {
            console.log('User not found with email:', email);
            return res.status(400).send({ message: "User not found." });
        }

        // console.log('User found:', user);

        // Compare the plain text password with the hashed password
        const isMatch = await bcrypt.compare(password, user.password);

        if (!isMatch) {
            console.log('Password does not match for user:', email);
            return res.status(400).send({ message: "Invalid credentials." });
        }

        console.log('Password matches for user:', email);

        // Format phone number to international format if necessary
        let phoneNumber = user.phoneNumber;
        if (!phoneNumber.startsWith('+')) {
            // Assuming the phone number is in local format without country code
            // Add your country code here, e.g., +255 for Tanzania
            // Remove leading zero(s) and add country code
            phoneNumber = '+255' + phoneNumber.replace(/^0+/, '');
        }

        // Send OTP using Africa's Talking
        const otp = user.auth_otp;

        console.log('Sending OTP to:', phoneNumber);
        console.log('OTP Code to:', otp);
        console.log('Using API key:', process.env.API_KEY);
        console.log('Using username:', process.env.USER_NAME);

        try {
            const response = await sms.send({
                to: phoneNumber,
                message: `Your OTP code is ${otp}`
            });

            // console.log('Auth OTP sent:', response);
            
            console.log('Auth OTP sent:', JSON.stringify(response, null, 2));

            res.status(200).send({ message: "Login successful!" });
        } catch (error) {
            console.error('Error sending OTP:', error.response ? error.response.data : error.message);
            res.status(500).send({ message: "Error sending OTP.", error: error.message });
        }

    } catch (err) {
        console.error('Error finding user:', err);
        return res.status(500).send({ message: "Error finding user." });
    }
}

// reset-Password API
const resetPassword = async (req, res) => {
    const { email, newPassword, confirmPassword } = req.body;

    if (!email) {
        return res.status(400).send({ message: "Email is required" });
    }

    if (!newPassword || !confirmPassword) {
        return res.status(400).send({ message: " newPassword and confirmPassword are required" });
    }


    if (newPassword !== confirmPassword) {
        return res.status(400).send({ message: "New password and confirm password do not match." });
    }

    try {

        // Fetch the user from the database
        const user = await prisma.user.findUnique({
            where: { email: email }
        });

        if (!user) {
            return res.status(400).send({ message: "User not found." });
        }


        // Check if the new password is the same as the old password
        const isNewPasswordSameAsOld = await bcrypt.compare(newPassword, user.password);
        if (isNewPasswordSameAsOld) {
            return res.status(400).send({ message: "New password cannot be the same as the old password." });
        }

        // Hash the new password
        const salt = await bcrypt.genSalt(10);
        const hashedNewPassword = await bcrypt.hash(newPassword, salt);

        // Update the password in the database
        const updatedUser = await prisma.user.update({
            where: { email: email },
            data: { password: hashedNewPassword }
        });

        res.status(200).send({ message: "Password reset successfully!", user: updatedUser });
    } catch (error) {

        console.error(error);
        return res.status(500).send({ message: "Error processing request." });

    }
}

// updateUserInfo API
const updateUserInfo = async (req, res) => {
    const { fullName, phoneNumber, email, imageUrl } = req.body;
    const { id } = req.params;

    // Validate that userId is provided
    if (!id) {
        return res.status(400).send({ message: "User ID is required." });
    }

    const userId = parseInt(id, 10);

    if (isNaN(userId)) {
        return res.status(400).send({ message: "Invalid user ID." });
    }

    try {
        // Fetch the user from the database
        const user = await prisma.user.findUnique({
            where: { id: userId }
        });

        if (!user) {
            console.log(user)
            return res.status(400).send({ message: "User not found." });
        }

        // Update user information
        const updatedUser = await prisma.user.update({
            where: { id: userId },
            data: {
                fullName: fullName || user.fullName,
                phoneNumber: phoneNumber || user.phoneNumber,
                email: email || user.email,
                imageUrl: imageUrl || user.imageUrl
            }
        });


        res.status(200).send({ message: "User info updated successfully!", user: updatedUser });

    } catch (error) {
        console.error(error);
        return res.status(500).send({ message: "Error processing request." });
    }
}

export {
    registerUser,
    loginUser,
    resetPassword,
    updateUserInfo
};
