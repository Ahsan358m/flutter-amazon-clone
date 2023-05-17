const express = require("express");
const User = require("../Models/userModel");

const createUser = async (req,res)=>{
    const {name, email, password} = req.body;
    const existingUser = await User.findOne({email});
    if(existingUser){
        return res.status(400).json({message:"User with same email address exists"});
    }
    let user = new User({
        name,
        email,
        password
    })
    user = await user.save();
    res.status(201).json({user, message:"User Created Successfully"});
}

module.exports = {
    createUser,
}