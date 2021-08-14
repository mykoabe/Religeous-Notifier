import jwt from 'jsonwebtoken'
import bcryptjs from 'bcryptjs'
import UserModel from '../Models/User.js';
import RepresentativeModel from '../Models/Representative.js';
import AppUserModel from '../Models/AppUser.js';
import dotenv from 'dotenv'
dotenv.config()

// Signup Controller 

export  const Signup = async (httprequest, httpresponse)=>{

    try {

        const fullName = httprequest.body.fullName;

        const userName = httprequest.body.userName;

        const email = httprequest.body.emailAddress;

        const password = httprequest.body.password;

        const confirmPassword = httprequest.body.confirmPassword;

        const userRole = httprequest.body.userRole
        
        if (!(email && password && fullName && userName)) {
            httpresponse.status(400).send("All input are required");
        }

        const check_user = await  UserModel.findOne({ email });
      
        if (check_user) {
            return httpresponse.status(409).json("user already exist!");
            
        }
       
        const  encryptedPassword = await bcryptjs.hash(password, 10);
       
        const  encryptedConfirmPassword = await bcryptjs.hash(confirmPassword, 10);
        const userInfo = {
          
            fullName,

            userName,

            emailAddress: email.toLowerCase(), 

            password: encryptedPassword,
          
            confirmPassword:encryptedConfirmPassword,
            
            userRole

        }

        if (userRole === "Representative"){
          const newUser = await RepresentativeModel.create(userInfo)
          
          console.log("Succesfully Registered!");
          return  httpresponse.status(201).json(newUser);

        }
        if (userRole === "User"){
          const newUser = await AppUserModel.create(userInfo)

          console.log("Succesfully Registered!");
          return  httpresponse.status(201).json(newUser);
          
        }


        

       
    } catch (error) {
        console.log(`error: ${error}`);
        
    }



}






// Login Controller




export const getallusers = async (httpreq, httpres) => {
    try {
      const users = await UserModel.find();
      if (users != null) {
        return httpres.status(200).json({ Users : users });
      } else {
        return httpres.status(400).send("Sorry, didnt get any user!");
      }
    } catch (error) {
      console.log(error);
    }
  };
  