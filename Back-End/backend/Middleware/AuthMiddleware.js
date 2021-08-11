import jwt from "jsonwebtoken";

import cookieParser from "cookie-parser";

export const VerifyCurrentToken = (req, res, next)=>{
    let token = req.headers['authorization'].split(" ")[1];

    if(!(token)){
        console.log(token);
        return res.status(403).send("A token is required for authentication");
    }
    try {
         jwt.verify(token, "my_key", (error, authdata) => {
             console.log(authdata);
         });
     
      } catch (err) {

        return res.status(401).send(`Invalid Token ${token}`);
    }   
    return next();



}