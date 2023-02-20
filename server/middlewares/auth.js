const jwt = require("jsonwebtoken");


const auth = async (req, res, next) => {
    try {
        const token = req.header();
    } catch (error) {
        res.status(500).json({error: error.message})
    }
}