const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const homepageRoutes = require('./routes/router'); // Import the router

const app = express();
const port = 8080;

// Set EJS as the templating engine
app.set('view engine', 'ejs');

// Set up the public folder for static files like CSS
app.use(express.static(path.join(__dirname, 'public')));

// Middleware to parse request bodies
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.json());


// Set up session management
app.use(session({
    secret: 'your_secret_key', // Change this to a more secure key in production
    resave: false,
    saveUninitialized: false,
    cookie: { 
        secure: false, // Set to true if using HTTPS
        maxAge: 30 * 60 * 1000 // 30 minutes
    }
}));

// Prevent caching for sensitive pages
app.use((req, res, next) => {
    res.header('Cache-Control', 'no-store, no-cache, must-revalidate, private');
    next();
});

// Use the homepage routes
app.use('/', homepageRoutes);

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
