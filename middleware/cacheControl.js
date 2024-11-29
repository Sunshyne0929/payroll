// middleware/cacheControl.js
const cacheControl = (req, res, next) => {
    res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate, private');
    res.setHeader('Pragma', 'no-cache');
    res.setHeader('Expires', '-1'); // Proxies
    next();
};

module.exports = cacheControl;
