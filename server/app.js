const express = require("express");
const mongoose = require("mongoose");
const app = express();
require("dotenv").config();
const user = require("./routes/userRoutes");


app.use(express.json());
app.use(express.urlencoded({extended:true}))
mongoose.connect(process.env.MONGODB_URI,{
}).then(()=>{
    console.log(`Connection to DB successfully ${process.env.MONGODB_URI}`)
}).catch((e)=>{
    console.log(e.stack)
});



app.use("/api/v1", user);





const serverListen = () => { app.listen(process.env.PORT, "0.0.0.0", ()=>{
    console.log(`Server is listening on port ${process.env.PORT}`);
})};


module.exports = serverListen;