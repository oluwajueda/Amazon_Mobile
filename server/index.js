const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");

const PORT = 3000;

const app = express();

const DB =
  "mongodb+srv://olamide:3435@cluster0.gkdbfpq.mongodb.net/?retryWrites=true&w=majority";
// Imports from other files
const authRouter = require("./routes/auth");

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
