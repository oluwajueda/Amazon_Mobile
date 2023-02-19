const express = require("express");
const mongoose = require("mongoose");

const PORT = 3000;

const app = express();

const DB =
  "mongodb+srv://olamide:3435@cluster0.gkdbfpq.mongodb.net/?retryWrites=true&w=majority";
// Imports from other files
const authRouter = require("./routes/auth");

//middleware
app.use(authRouter);

//Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => {
  console.log(`connected at port ${PORT}`);
});
