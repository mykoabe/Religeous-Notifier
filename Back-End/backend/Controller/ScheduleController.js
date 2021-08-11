import ScheduleModel from "../Models/Schedule.js";



export const createSchedule = async(httpreq, httpres) =>{

    try {
        const getPostedSchedule = httpreq.body;

        await ScheduleModel.create(getPostedSchedule);

        return httpres.status(201).json({"message": "Schedule Created"});
        
    } catch (error) {

        console.log(error);
        
    }


}

 
export const deleteSchedule = async(httpreq, httpres) =>{

    try {
        const getparams = httpreq.query.id;

        const finalparam = getparams.slice(10, getparams.length-2);

        const findSchedule = await ScheduleModel.findById({ "_id":finalparam});

        if(findSchedule){

            await ScheduleModel.deleteOne({"_id":finalparam})
            return httpres.json({"Message": "Succesfully Deleted"});


        }


        return httpres.status(404).send(`failed!`);

    
        
    } catch (error) {

        console.log(error);
        
    }


}

 
export const updateSchedule = async(httpreq, httpres) =>{

    try {
        const getupdateddata= httpreq.body;

        const checkSchedule = await ScheduleModel.findOne({"_id":  getupdateddata._id});

        if(checkSchedule){

            await ScheduleModel.updateOne(checkSchedule,{$set : getupdateddata} );
            return httpres.status(201).send("Succesfully updated!")

        }else{
            return httpres.status(400).send("Schedule Doesnt exist");
        }
        
    
        
    } catch (error) {

        console.log(error);
        
    }


}

 
export const getallSchedules = async(httpreq, httpres) =>{

    try {

        const schedules = await ScheduleModel.find();
        if(schedules){
            return httpres.status(200).send(`Schedules : ${schedules}`);

        }else{
            return httpres.status(400).send("Sorry, didnt get any schedule!");
        }
        // httpres.status(200).send("all Schedules");
        
    
        
    } catch (error) {

        console.log(error);
        
    }


}



