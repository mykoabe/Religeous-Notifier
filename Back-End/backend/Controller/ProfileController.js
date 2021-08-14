import UserModel from "../Models/User.js";


// Update User Account

export const updateProfile = async(httpreq, httpres)=>{

    try {
        const getupdateinfo = httpreq.body;

        const checkuser = await UserModel.findOne({emailAddress: getupdateinfo.emailAddress});
        console.log(checkuser);
        if(checkuser){

            await UserModel.updateOne(checkuser,{$set : getupdateinfo} );
            return httpres.status(201).send("Succesfully updated!")

        }else{
            return httpres.status(400).send("User doesnt exist");
        }
        
    } catch (error) {
        
    }


}



// Delete User Account

export const deletePofile = async(httpreq, httpres)=>{

    try {
        const getuser = httpreq.body;

        const checkuser = await UserModel.findOne({emailAddress: getuser.emailAddress});

        if(checkuser){
            await UserModel.deleteOne({emailAddress:checkuser.emailAddress});
            return httpres.status(200).send("Succesfully Deleted!")
        }else{
            return httpres.status(400).send("User doesnt exist");
        }
        
    } catch (error) {
        
    }

}

