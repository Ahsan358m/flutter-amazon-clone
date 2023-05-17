const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name:{
        type:String,
        required:[true, "Please Enter your User-Name"],
        trim:true,
        minLength:[8, "Name cannot be less then 8 characters"],
    },
    email:{
        type:String,
        required:[true, "Please Enter your E-mail"],
        trim:true,
        unique:true,
        validate:{
            validator:(value) =>{
                const re =
                /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message:"Please enter a valid email address",
        },
    },
    password:{
        type:String,
        required:[true, "Please enter Password"],
        validate:{
            validator:(value) =>{
                return value.length >6;
            },
            message:"Please enter a long password",
        },
    },
    address:{
        type:String,
        default :"",
    },
    type:{
        type:String,
        default:"user",
    }
});

const User = mongoose.model("User", userSchema);
module.exports = User;