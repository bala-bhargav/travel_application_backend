import {z} from 'zod';

export const seatValidation = z.object({
    seatNo: z.string({message: "enter a seat number"}).regex(/^[A-Z]{1}[0-9]{1,2}$/,{message: "enter a valid seat number"}),
    busId: z.number({message: "enter a number"}).min(1),
    status: z.string({message: "enter a status"})   
})