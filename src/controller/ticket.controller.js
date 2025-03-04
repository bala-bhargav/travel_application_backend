import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { ticketValidation } from '../validations/ticket.validation.js';

export const postTicket = async (req, res, next) => {
  try {
    const { busId, userId, seatId, paymentId} = ticketValidation.parse(req.body);
    console.log('budId', busId, userId, seatId, paymentId);
    const ticket_data = await prisma.ticket.create({
      data: {
        busId,
        userId,
        seatId,
        paymentId,
      },
    });
    console.log('prisma_data', ticket_data);
    console.log(1);
    return res.status(201).json({
      status: 'success',
      data: ticket_data,
    });
  } catch (error) {
    console.log(error.message);
    return next(new AppError('Something went wrong', error.message));
  }
};


export const updateTicket = async (req,res,next) => {
    try{
       const {id, ...reqData} = req.body;
       const updateTicketData = await prisma.ticket.update({
        where:{id:id},
        data:reqData
       })
       return res.status(201).json({
        status:'success',
        data:updateTicketData
       })
     }
    catch(error){
      console.log(error.message)
      return next(new AppError('something went wrong',error.message));
    }
}

export const deleteTicket= async (req,res,next) => {
  try{
    const {id} = req.body;
    const reqDataDelete = await prisma.ticket.delete({
       where:{id:id}
    })
    return res.status(201).json({
       status:'deleted ticket successfully'
    })
  }
  catch(error){
   console.log(error.message)
   return next(new AppError('something went wrong ',error.message));
  }
}