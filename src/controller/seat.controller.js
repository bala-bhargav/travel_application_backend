import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { seatValidation } from '../validations/seat.validation.js';

export const postSeat = async (req, res, next) => {
  try{
    const {seatNo, busId, status} = seatValidation.parse(req.body);
    console.log(req.body);
    const seatData = await prisma.seat.create({
      data: {seatNo, busId, status}
    });
    console.log(seatData)
    return res.status(201).json({
      status: 'success',
      data: seatData
    });
  }
  catch(error){
    console.log(error.message);
    return next(new AppError('Something went wrong', error.message));
  }
};