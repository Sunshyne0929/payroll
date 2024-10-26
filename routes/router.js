// routes/router.js

const express = require('express');
const router = express.Router();
const authController = require('../controller/controllers'); // Import the controllers

// Homepage route
router.get('/', (req, res) => {
    res.render('homepage');
});

// Signup page route
router.get('/signup', (req, res) => {
    res.render('signup');
});

// Handle signup form submission
router.post('/signup', authController.signup); // Correctly reference the signup function

// Signin page route
router.get('/signin', (req, res) => {
    res.render('signin');
});

// Handle signin form submission
router.post('/signin', authController.signin);

// Add the employee route
router.get('/employee', (req, res) => {
    res.render('employee'); // Make sure 'employee' matches your EJS file name
});

router.get('/admin', (req, res) => {
    res.render('admin');
});

module.exports = router;
