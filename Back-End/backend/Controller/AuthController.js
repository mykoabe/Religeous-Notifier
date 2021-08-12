import jwt from 'jsonwebtoken'
import bcryptjs from 'bcryptjs'
import UserModel from '../Models/User.js';
import RepresentativeModel from '../Models/Representative.js';
import AppUserModel from '../Models/AppUser.js';

// Signup Controller 

export  const Signup = async (httprequest, httpresponse)=>{

    try {

        const fullName = httprequest.body.fullName;

        const userName = httprequest.body.userName;

        const userEmailAddress = httprequest.body.emailAddress;

        const password = httprequest.body.password;

        const confirmPassword = httprequest.body.confirmPassword;

        const userRole = httprequest.body.userRole
        
        if (!(userEmailAddress && password && fullName && userName)) {
            httpresponse.status(400).send("All input is required");
        }

        const check_user = await  UserModel.findOne({ userEmailAddress });
      
        if (check_user) {
            return httpresponse.status(409).json("user already exist!");
            
        }
       
        const  encryptedPassword = await bcryptjs.hash(password, 10);
       
        const  encryptedConfirmPassword = await bcryptjs.hash(confirmPassword, 10);
        const userInfo = {
          
            fullName,

            userName,

            emailAddress: userEmailAddress.toLowerCase(), 

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

export  const Signin = async (httprequest, httpresponse)=>{

        try{
            const {emailAddress , password} = httprequest.body;

            if (!(emailAddress && password)) {

                httpresponse.status(400).send("All input is required");

              }
        

            const currentUser = await UserModel.findOne({emailAddress});
            const check_password = await bcryptjs. compare(password , currentUser.password);
            
            if (currentUser && check_password){

                const Generate_Token = jwt.sign(
                    {currentUser}, 
                    "my_key" , 
                    {
                        expiresIn:"2h"
                    }
                );
                console.log("Succesfully Logged In");
                httpresponse.status(200).json({"access_token":Generate_Token , "currentuser":currentUser});
            }
            else{

            return httpresponse.status(400).json( {"errormessage": "Invalid Credentials"});
            }

        }catch(error_occured){
            console.log(error_occured);
        }


}


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
  