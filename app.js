// app.js
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const homepageRoutes = require('./routes/router'); // Import the router

const app = express();
const port = 8080;

// Set EJS as the templating engine
app.set('view engine', 'ejs');

// Set up the public folder for static files like CSS
app.use(express.static(path.join(__dirname, 'public')));

// Middleware to parse request bodies
app.use(bodyParser.urlencoded({ extended: true }));

// Use the homepage routes
app.use('/', homepageRoutes);

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
