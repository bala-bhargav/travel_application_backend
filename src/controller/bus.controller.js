import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { busValidation } from '../validations/bus.validation.js';

export const postBus = async (req, res, next) => {
  try {
    const { busName, busNumber, busType, busFuelCapacity, busAddress, busOwnerId } =
      busValidation.parse(req.body);
    const bus_data = await prisma.bus.create({
      data: { busName, busNumber, busType, busFuelCapacity, busAddress, busOwnerId },
    });
    return res.status(201).json({
      status: 'success',
      data: bus_data,
    });
  } catch (error) {
    console.log(error.message);
    return next(new AppError('Something went wrong', error.message));
  }
};

export const updateBus = async (req, res, next) => {
  try {
    const { id, ...updateFields } = req.body;
    const data = await prisma.bus.update({
      where :{
        id : id
      },
      data :updateFields
    });
    return res.status(201).json({
      status:'success',
      data:data
    })
  } catch (error) {
    console.log(error.message);
    return next(new AppError('Something went wrong', error.message));
  }
};

export const deleteBus = async(req,res,next) =>{
  try{
    const {id} = req.body;
    const reqdeleteBus = await prisma.bus.delete({
      where:{id:id}
    })
    return res.status(201).json({
      status:'deleted successfully'
    })
  } 
  catch(error){
    console.log(error.message)
    return next(new AppError('something went wrong',error.message));
  }
}
