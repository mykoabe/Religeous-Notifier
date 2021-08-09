
import mongoose from 'mongoose'

const databaseUrl = "mongodb://localhost:12345/ampdatabase";

const databaseconfiguration = () =>{

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
        console.log("Sorry! the Database connection Failed");
    })

}

export default databaseconfiguration;


