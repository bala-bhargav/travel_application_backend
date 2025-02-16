import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { stopValidation } from '../validations/stop.validation.js';

export const postStop = async (req, res, next) => {
try{
    const { name,searchId } = stopValidation.parse(req.body);
    const stop_data = await prisma.stop.create({
        data: {
            name,
            searchId
        }
    });
    return res.status(201).json({
        status: 'success',
        data: stop_data
    });
}
catch(error){
    console.log(error.message);
      return next(new AppError('Something went wrong', error.message));
}
};

export const updateStop = async (req, res, next) =>{
    try{
      const {id, ...reqData} = req.body;
      const updateData = await prisma.stop.update({
        where:{id:id},
        data:reqData
      }) 
      return res.status(201).json({
        status:'success',
        data:updateData
      })
    }
    catch(error){
        console.log(error.message)
        return next(AppError('something went wrong ',error.message));
    }
}

export const deleteStop= async (req,res,next) => {
    try{
      const {id} = req.body;
      const reqDataDelete = await prisma.stop.delete({
         where:{id:id}
      })
      return res.status(201).json({
         status:'deleted stop successfully'
      })
    }
    catch(error){
     console.log(error.message)
     return next(new AppError('something went wrong ',error.message));
    }
  }