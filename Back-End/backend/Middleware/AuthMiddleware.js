import jwt from "jsonwebtoken";

export const  VerifyCurrentToken = (req, res, next)=>{
   console.log("Request has juss comming....")
   const tokeninheader  = req.headers.authorization;

   if (typeof tokeninheader !== 'undefined'){
       req.token = tokeninheader;

       jwt.verify(req.token  , 'my_key' ,(err , authdata)=>{
        if(err){
          res.send(`${err}`);
    
        }
        else {
            console.log(authdata);
       next();

        }
    
      } );

   }
   else{
       res.send("Can't get token!");    
   }


}