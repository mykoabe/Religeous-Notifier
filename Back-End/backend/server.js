
import express  from 'express'
import databaseconfiguration from './Config/DatabaseConfig.js';
import bodyParser from 'body-parser';
import { authRoute } from './Routes/AllRoutes.js';
const app = express()
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

const PORT =process.env.PORT||  3500;

databaseconfiguration();

app.use('/api' , authRoute);
app.get('/' , (httprequest , httpresponse)=>{

    return httpresponse.json({"message" : "Advanced mobile Programming, Final Project"})

});


app.listen(PORT, ()=>{

    console.log(`Server is running at ${PORT}`)

});