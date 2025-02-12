import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { busOwnerValidation } from '../validations/busOwner.validation.js';

export const postBusOwner = async (req, res, next) => {
   try{
       const {ownerName,age ,phoneNumber,email , role} = busOwnerValidation.parse(req.body);
         const busOwnerData = await prisma.busOwner.create({
              data: {ownerName,age ,phoneNumber,email , role}
         });
         return res.status(201).json({
             status: 'success',
             data: busOwnerData
         });
   }
   catch(error){
        console.log(error.message);
        return next(new AppError('Something went wrong', error.message));
   }
};