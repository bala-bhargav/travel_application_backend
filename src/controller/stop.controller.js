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