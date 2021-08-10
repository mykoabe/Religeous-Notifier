import mongoose from "mongoose";

const ScheduleFields = {  

 
    programs :{
        type:[],
        default:null,
        required:true,
    }
    
}

const ScheduleSchema = mongoose.Schema(ScheduleFields);

const ScheduleModel = mongoose.model('schedule' , ScheduleSchema);

export default ScheduleModel