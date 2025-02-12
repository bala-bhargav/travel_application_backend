import {z} from 'zod';

export const searchValidation = z.object({
    name: z.string({message: "enter a name"}).regex(/^[a-zA-Z]+$/,{message: "enter a valid name"}),
    arrival: z.string({message:"enter a valid arrival station"}).regex(/^[a-zA-Z]+$/,{message:"enter a valid arrivasl station"}),
    destination: z.string({message:"enter a valid destination station"}).regex(/^[a-zA-Z]+$/,{message:"enter a valid arrivasl station"}),
    busTimings:z.string({message:"enter the busTimings"}).regex(/^[0-9]{1,2}[:]{1}[0-9]{1,2}[-]{1}[0-9]{1,2}[:]{1}[0-9]{1,2}/,{message:"enter a valid busTimings"}),
    busId: z.number({message:"enter a valid busId"}).min(1,{message:"enter a valid busId"})
})