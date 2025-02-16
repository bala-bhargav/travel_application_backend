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

export const updateBusOwner = async (req,res,next) => {
     try{
      const {id, ...updateField} = req.body;
      const updatedOwner = await prisma.busOwner.update({
          where:{
          id:id
          },
          data:updateField
      })
      return res.status(201).json({
          status:'success',
          data:updatedOwner
      })
     }
     catch(error){
          console.log(error.message)
          return next(new AppError('this is the error',error.message));
     }
};

export const deleteOwner = async (req,res,next) => {
     try{
       const {id} = req.body;
       const reqDataDelete = await prisma.busOwner.delete({
          where:{id:id}
       })
       return res.status(201).json({
          status:'deleeted busOwner successfully'
       })
     }
     catch(error){
      console.log(error.message)
      return next(new AppError('something went wrong ',error.message));
     }
}