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
      const seat_status = "Available"
      console.log(arrival,destination);
      const result = await prisma.$queryRawUnsafe('SELECT DISTINCT buses.busNumber, buses.id, seats.seatNo FROM searches INNER JOIN stops ON searches.id = stops.searchId INNER JOIN seats ON searches.busId = seats.busId INNER JOIN buses ON searches.busId = buses.id WHERE (searches.arrival = ? OR EXISTS (SELECT 1 FROM stops s1 WHERE s1.searchId = searches.id AND s1.name = ?)) AND (searches.destination = ? OR EXISTS (SELECT 1 FROM stops s2 WHERE s2.searchId = searches.id AND s2.name = ?)) AND seats.status = ?',arrival,arrival,destination,destination,seat_status);

        console.log(result)
      return res.status(201).json({
        status: 'success',
        data: result
      });
   } 
   catch(error){
    console.log(error.message);
    return next(new AppError('Something went wrong', error.message));
   }
};

export const deleteSearch= async (req,res,next) => {
  try{
    const {id} = req.body;
    const reqDataDelete = await prisma.search.delete({
       where:{id:id}
    })
    return res.status(201).json({
       status:'deleeted search successfully'
    })
  }
  catch(error){
   console.log(error.message)
   return next(new AppError('something went wrong ',error.message));
  }
}


