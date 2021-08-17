
import mongoose from 'mongoose'

// const databaseUrl = "mongodb://localhost:12345/ampdatabase";


const databaseconfiguration = async() =>{

    const conn = await mongoose.connect(, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
        useCreateIndex: true,
        useFindAndModify: false,
      })
      console.log(`Mongoose connected: ${conn.connection.host}`);

}

module.exports = databaseconfiguration;


