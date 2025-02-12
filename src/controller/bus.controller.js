import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { busValidation } from '../validations/bus.validation.js';

export const postBus = async (req,res,next) => {
 try{
   const {busName, busNumber,  busType,busFuelCapacity, busAddress,busOwnerId}= busValidation.parse(req.body);
   const bus_data = await prisma.bus.create({
     data : {busName, busNumber, busType,busFuelCapacity, busAddress,busOwnerId}
   });
    return res.status(201).json({
      status: 'success',
      data: bus_data
    });
 }
 catch(error){
   console.log(error.message);
   return next(new AppError('Something went wrong', error.message));
 }
};