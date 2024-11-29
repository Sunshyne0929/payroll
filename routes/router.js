const express = require('express');
const router = express.Router();
const authController = require('../controller/controllers');
const authMiddleware = require('../middleware/authMiddleware');
const cacheControl = require('../middleware/cacheControl');


// Homepage route
router.get('/', (req, res) => {
    res.render('homepage');
});

// Signup routes
router.get('/signup', (req, res) => {
    res.render('signup');
});
router.post('/signup', authController.signup);

// Signin routes
router.get('/signin', (req, res) => {
    res.render('signin');
});
router.post('/signin', authController.signin);


// Logout route
router.get('/logout', authController.logout);

// Protected routes
router.get('/employee', authMiddleware.isAuthenticated, authController.getEmployeeProfile);
router.post('/employee/employment', authMiddleware.isAuthenticated, authController.saveEmploymentInfo);
router.post('/employee/leave', authMiddleware.isAuthenticated, authController.submitLeaveRequest);
router.post('/employee/profile', authMiddleware.isAuthenticated, authController.updateProfile);
router.post('/employee/employment', authMiddleware.isAuthenticated, authController.updateEmploymentInfo);

// Admin route
// Admin route to fetch all employees
router.get('/admin', authMiddleware.isAuthenticated, authMiddleware.isAdmin, authController.renderAdminPage);
// Admin route to save holiday
router.post('/admin/holidays', authMiddleware.isAuthenticated, authController.addHoliday);


router.get('/admin/employees', authMiddleware.isAuthenticated, authController.getEmployeesByDepartment);
// Modify this route to handle the dynamic :idNumber parameter
router.get('/admin/employees/:idNumber', authMiddleware.isAuthenticated, authController.getEmployeeInfo);

module.exports = router;