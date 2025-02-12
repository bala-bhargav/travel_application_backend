import {z} from 'zod';

export const bookingHistoryValidation = z.object({
  ticketId:z.number({message:"enter a ticketId"}).min(1,{message:"enter a valid ticketId"}),
  userId:z.number({message:"enter a userId"}).min(1,{message:"enter a valid userId"}),
  status:z.string({message:"enter a status"})
})