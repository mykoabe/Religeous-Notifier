const jwt = require("jsonwebtoken");

exports.VerifyCurrentToken = (req, res, next)=>{
    let token = req.headers['authorization'].split(" ")[1];

    if(!(token)){
        console.log(token);
        next(new ErrorResponse("A token is required for authentication"))
    }
    try {
         jwt.verify(token, "my_key", (error, authdata) => {
             console.log(authdata);
         });
     
      } catch (err) {
        next(new ErrorResponse(`Invalid Token ${token}`));
    }   
    return next();



}