const models = require('../model/models'); // Ensure this path is correct

// Signup controller
exports.signup = async (req, res) => {
    const userData = {
        last_name: req.body.last,
        first_name: req.body.first,
        middle_name: req.body.middle,
        dob: req.body.dob,
        gender: req.body.gender,
        status: req.body.status,
        contact_number: req.body.number,
        emergency_number: req.body.emernumber,
        address: req.body.address,
        email: req.body.email,
        id_number: req.body.idnum,
        password: req.body.password
    };

    try {
        await models.createUser(userData);
        res.redirect('/signin'); // Redirect to signin page after successful signup
    } catch (err) {
        res.status(500).send("Error creating user: " + err.message);
    }
};

// Signin controller
exports.signin = async (req, res) => {
    const idnum = req.body.idnum; 
    const password = req.body.password;

    try {
        const user = await models.findUserByIdNum(idnum);
        if (!user) {
            return res.status(401).send("User not found.");
        }

        const isMatch = await models.verifyPassword(password, user.password);
        if (!isMatch) {
            return res.status(401).send("Invalid password.");
        }

        // Password is valid, redirect to employee.js
        res.redirect('/employee'); 
    } catch (err) {
        res.status(500).send("Error processing request: " + err.message);
    }
};
