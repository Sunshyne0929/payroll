const db = require('../connection/db'); // Adjust the path as necessary
const bcrypt = require('bcrypt');

// Create a new user in the database
const createUser = async (userData) => {
    const hashedPassword = await bcrypt.hash(userData.password, 10);

    const query = `
    INSERT INTO users (last_name, first_name, middle_name, dob, gender, status, contact_number, emergency_number, address, email, id_number, password, created_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT)
    `;
    const data = [
        userData.last_name,
        userData.first_name,
        userData.middle_name,
        userData.dob,
        userData.gender,
        userData.status,
        userData.contact_number,
        userData.emergency_number,
        userData.address,
        userData.email,
        userData.id_number,
        hashedPassword
    ];

    return new Promise((resolve, reject) => {
        db.query(query, data, (err, results) => {
            if (err) reject(err);
            resolve(results);
        });
    });
};

// Find a user by ID number for signin and validate password
const findUserByIdNum = (idnum) => {
    const query = 'SELECT * FROM users WHERE id_number = ?';
    return new Promise((resolve, reject) => {
        db.query(query, [idnum], (err, results) => {
            if (err) return reject(err);
            if (results.length === 0) return resolve(null); // User not found
            resolve(results[0]); // Return the user
        });
    });
};

// Verify password
const verifyPassword = (enteredPassword, storedPassword) => {
    return bcrypt.compare(enteredPassword, storedPassword);
};

module.exports = { createUser, findUserByIdNum, verifyPassword };
