import jwt from 'jsonwebtoken'
import bcryptjs from 'bcryptjs'
import HolyPlaceModel from '../Models/Holyplace.js';
import UserModel from '../Models/User.js';
import RepresentativeModel from '../Models/Representative.js';

export const createHolyPlace = async (httpreq, httpres) => {
    try {
          
      const getHolyPlaceInfo = httpreq.body;
      const holyplace = new HolyPlaceModel(getHolyPlaceInfo);
      await holyplace.save();
      console.log(holyplace);
  
      const creator = await RepresentativeModel.findById({
        _id: getHolyPlaceInfo.createdby,
      });
      if(creator){
        creator.holyplace = holyplace;
        await creator.save();
      }

  
  
      if (holyplace) {
        return httpres.status(201).json({ message: "holyplace Created" });
      } else {
        return httpres
          .status(400)
          .json({ message: "Sorry Failed to Create holyplace." });
      }
    } catch (error) {
      console.log(error);
    }
  };