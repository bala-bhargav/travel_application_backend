import prisma from '../config/db.js';
import AppError from '../utils/AppError.js';
import { searchValidation } from '../validations/search.validation.js';

export const postSearch = async (req, res, next) => {
  try{
    const {name, arrival,destination , busTimings,busId} = searchValidation.parse(req.body);
    const postsearch = await prisma.search.create({
      data: {
        name,
        arrival,
        destination,
        busTimings,
        busId
      }
    });
    return res.status(201).json({
      status: 'success',
      data: postsearch
    });
  }
  catch(error){
    console.log(error.message);
    return next(new AppError('Something went wrong', error.message));
  }
};


export const getSearch = async (req, res, next) => {
   try{
      const {arrival,destination} = req.body;
      console.log(arrival,destination);
      const result = await prisma.$queryRawUnsafe('SELECT searches.id FROM searches INNER JOIN stops ON searches.id = stops.searchId WHERE searches.arrival = "Hyderabad" OR stops.name = "Hyderabad"  ')
    //   const busData = await prisma.$queryRawUnsafe(
    //     `SELECT buses.id, buses.busName, buses.busNumber, buses.busType
    //      FROM buses 
    //      WHERE buses.id IN (${result.map(() => "?").join(",")})`,
    //     ...result
    // );
      console.log(result);
      return res.status(200).json({
        status: 'success',
        data: result
      });
   } 
   catch(error){
    console.log(error.message);
    return next(new AppError('Something went wrong', error.message));
   }
};


