import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { bookingHistoryValidation } from '../validations/bookingHistory.validation.js';

export const postHistory = async (req,res,next) => {
 try{
  const{ ticketId, userId,status } = bookingHistoryValidation.parse(req.body);
  const history_data = await prisma.bookingHistory.create({
   data: { ticketId, userId,status }
  });

  return res.status(201).json({
   status: 'success',
   data: history_data
  });
 }
 catch(error){
     console.log('I am in this', error);
     return next(new AppError('Something went wrong', error.message));
 }
};