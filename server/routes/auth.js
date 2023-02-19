const express = require("express");
const User = require("../model/user");
const bcryptjs = require("bcryptjs");

const authRouter = express.Router();

// SIGN UP

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res.status(400).json({
        msg: "User with same email already exists!",
      });
    }

    const hashPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashPassword,
      name,
    });

    user = await user.save();
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = authRouter;
