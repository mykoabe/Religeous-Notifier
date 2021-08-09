import jwt from "jsonwebtoken";
import bcrypt from 'bcryptjs'
import UserModel from "../Models/User.js";
import mongoose from 'mongoose';

// Signup Controller 
export  const Signup = async (httprequest, httpresponse)=>{

    try {
        
        const fullName = httprequest.body.fullName;
        const userName = httprequest.body.userName;
        const emailAddress = httprequest.body.emailAddress;
        const password = httprequest.body.password;
        const confirmPassword = httprequest.body.confirmPassword;

        
        if (!(emailAddress && password && fullName && userName)) {
            httpresponse.status(400).send("All input is required");
        }

        const check_user = await UserModel.findOne({ emailAddress });
      
        if (check_user) {
            return httpresponse.status(409).json("user already exist!");
            
        }
        else {
            return httpresponse.send("user not found")
        }
        const  encryptedPassword = await bcrypt.hash(password, 10);
        const  encryptedConfirmPassword = await bcrypt.hash(confirmPassword, 10);



        const newUser = await UserModel.create({
            fullName,
            userName,
            emailAddress: emailAddress.toLowerCase(), 
            password: encryptedPassword,
            confirmPassword:encryptedConfirmPassword,

          });
        const createtoken = jwt.sign(
          { user_id: UserModel._id, emailAddress },
              "my_secret",
           {
            expiresIn: "2h",
          }
        );
        newUser.token =  createtoken;
       
        httpresponse.status(201).json(newUser);
    } catch (error) {
        console.log(`error: ${error}`);
        
    }

}






// Login Controller

export const Signin = async (httprequest, httpresponse)=>{

        try{
            const {emailAddress , password} = req.body;

            if (!(emailAddress && password)) {
                httpresponse.status(400).send("All input is required");
              }
            

            const currentUser = UserModel.findOne({email});
            if (currentUser && bcrypt.compare(password , currentUser.password)){

                const Generate_Token = jwt.sign(
                    {user_id:currentUser._id , emailAddress}, 
                    "my_secret", 
                    {
                        expiresIn:"2h"
                    }
                );

                currentUser.token = Generate_Token;
            
                httpresponse.send(`logged in succesfully ${Generate_Token}`)

            }

            httpresponse.send(400).send("Invalid Credentials");

        }catch(error_occured){
            console.log(error_occured);
        }

}


