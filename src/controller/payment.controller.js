import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { paymentValidation } from '../validations/payment.validation.js';

export const postPayment = async (req, res, next) => {
  try {
    const { userId, status, cost, paymentType } = paymentValidation.parse(req.body);
    console.log('req.body', req.body);
    console.log('payment', paymentType);
    const paymentData = await prisma.payment.create({
      data: {
        userId,
        status,
        cost,
        paymentType:paymentType
      },
    });
    console.log("error",paymentData);
    return res.status(201).json({
      status: 'success',
      data: paymentData,
    });
  } catch (error) {
    console.log(error.message);
    return next(new AppError('Something went wrong', error.message));
  }
};
