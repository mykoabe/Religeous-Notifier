import mongoose from 'mongoose';

const HolyplaceFields = {

    name :{
        type:String,
        default:null,
        required:true,
        
    },
    location :{
        type:String,
        default:null,
        required:true
    },
    history:{
        type:String,
        default:null,
        required:true
    },
    image:{
        type:String,
        default:null,
    }



}


const HolyPlaceSchema = Schema(HolyplaceFields);

const HolyPlaceModel = model('holyplaces' , HolyPlaceSchema);

export default HolyPlaceModel;