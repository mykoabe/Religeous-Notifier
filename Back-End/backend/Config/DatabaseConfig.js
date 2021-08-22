
import mongoose from 'mongoose'

//Genymotion emulator address 192.168.60.1
//Genymotion emulator address 192.168.60.1


const databaseUrl = "mongodb://localhost:12345/ampdatabase";

export const databaseconfiguration = () =>{

    mongoose.connect(databaseUrl, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
        useCreateIndex: true,
        useFindAndModify: false,
      })
    .then(()=>{
        console.log("Database connected succesfully!");
    })
    .catch((error)=>{
        console.log("Sorry!, the Database connection Failed");
    })

}


