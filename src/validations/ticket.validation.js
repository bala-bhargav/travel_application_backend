import {z} from 'zod';

export const ticketValidation = z.object({
  userId:z.number({message:"enter a userId"}).min(1,{message:"enter a valid userId"}),
  busId:z.number({message:"enter a busId"}).min(1,{message:"enter a valid busId"}),
  seatId:z.number({message:"enter a seatId"}).min(1,{message:"enter a valid seatId"}),
  paymentId:z.number({message:"enter a paymentId"}).min(1,{message:"enter a valid paymentId"})
})