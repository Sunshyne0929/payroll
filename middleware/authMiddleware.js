// In your authMiddleware.js
exports.isAuthenticated = (req, res, next) => {
    if (req.session.userId) {
        return next(); // User is authenticated
    }
    res.redirect('/signin'); // Redirect to sign-in if not authenticated
};

exports.isAdmin = (req, res, next) => {
    if (req.session.role === 'Admin') {
        return next(); // User is an admin
    }
    res.status(403).send("Access denied."); // Not an admin
};
