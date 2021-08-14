import jwt from "jsonwebtoken";
import bcrypt from 'bcryptjs'
import UserModel from "../Models/User.js";


// Signup Controller 
export  const Signup = async (httprequest, httpresponse)=>{

    try {
        
        const fullName = httprequest.body.fullName;

        const userName = httprequest.body.userName;

        const emailAddress = httprequest.body.emailAddress;

        const password = httprequest.body.password;

        const confirmPassword = httprequest.body.confirmPassword;

        const userRole = httprequest.body.userRole
        
        if (!(emailAddress && password && fullName && userName)) {
            httpresponse.status(400).send("All input is required");
        }

        const check_user = await UserModel.findOne({ emailAddress });
      
        if (check_user) {
            return httpresponse.status(409).json("user already exist!");
            
        }
       
        const  encryptedPassword = await bcrypt.hash(password, 10);
       
        const  encryptedConfirmPassword = await bcrypt.hash(confirmPassword, 10);

        const newUser = await UserModel.create({

            fullName,

            userName,

            emailAddress: emailAddress.toLowerCase(), 

            password: encryptedPassword,
          
            confirmPassword:encryptedConfirmPassword,
            
            userRole

          });

    
        console.log("Succesfully Registered!");
        return  httpresponse.status(201).json(newUser);
    } catch (error) {
        console.log(`error: ${error}`);
        
    }



}





// Login Controller

export const Signin = async (httprequest, httpresponse)=>{

        try{
            const {emailAddress , password} = httprequest.body;

            if (!(emailAddress && password)) {

                httpresponse.status(400).send("All input is required");

              }
        

            const currentUser = await UserModel.findOne({emailAddress});
            if (currentUser && bcrypt.compare(password , currentUser.password)){

                const Generate_Token = jwt.sign(
                    {currentUser}, 
                    "my_key" , 
                    {
                        expiresIn:"2h"
                    }
                );
                httpresponse.status(200).json({"access_token":Generate_Token , "currentuser":currentUser});
            }
            else{

            return httpresponse.status(400).send("Invalid Credentials");
            }

        }catch(error_occured){
            console.log(error_occured);
        }


}


