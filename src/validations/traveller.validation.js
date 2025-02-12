import {z} from 'zod';

export const travellerValidation = z.object({
   name:z.string({message:"enter a name"}).regex(/^[a-zA-Z]+$/,{message:"enter a valid name"}),
   age:z.number({message:"enter a age"}).min(1,{message:"enter a valid age"}),
   gender:z.string({message:"ente the gender"}),
   seatId:z.number({message:"enter a seatId"}).min(1,{message:"enter a valid seatId"}),
   phoneNumber:z.string({message:"enter a phoneNumber"}).regex(/^[0-9]{10}$/,{message:"enter a valid phoneNumber"}),
   ticketId:z.number({message:"enter a ticketId"}).min(1,{message:"enter a valid ticket"})
})