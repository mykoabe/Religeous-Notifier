
import express  from 'express'

const app = express()

const PORT = 3500;


app.get('/' , (httprequest , httpresponse)=>{

    return httpresponse.json({"message" : "Advanced mobile Programming, Final Project"})

});

app.listen(PORT, ()=>{

    console.log(`Server is running at ${PORT}`)

});