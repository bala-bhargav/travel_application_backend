import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { travellerValidation } from '../validations/traveller.validation.js';

export const postTraveller = async (req,res,next) => {
      try{
        const {name, age, gender, seatId,phoneNumber,ticketId} = travellerValidation.parse(req.body);

        const st = {name, age, gender, seatId,phoneNumber,ticketId};
        const traveller_data = await prisma.traveller.create({
          data : {name, age, gender, seatId,phoneNumber,ticketId}
        });      
        return res.status(201).json({
         status: 'success',
         data: traveller_data
        });
      }
      catch(error){
        console.log('I am in this', error);
         return next(new AppError('Something went wrong', error.message));
      }
};
