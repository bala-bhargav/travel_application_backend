import {z} from 'zod';

export const paymentValidation = z.object({
  userId:z.number({message:"enter a userId"}).min(1,{message:"enter a valid userId"}),
  status :z.string({message:"enter a status"}),
  cost:z.number({message:"enter a cost"}).min(1,{message:"enter a valid cost"}),
});