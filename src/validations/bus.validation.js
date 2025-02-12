import {z} from 'zod';

export const busValidation = z.object({
  busName: z.string({message: "enter a bus name"}),
  busNumber: z.string({message: "enter a bus number"}).regex(/[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$/,{message: "enter a valid bus number"}),
  busType: z.string({message: "enter a bus type"}),
  busFuelCapacity: z.number({message: "enter a number"}).min(1),
  busAddress: z.string({message: "enter a bus address"}),
  busOwnerId:z.number({message: "enter a number"}).min(1)
})