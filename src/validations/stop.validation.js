import {z} from 'zod';

export const stopValidation = z.object({
    searchId: z.number({message: "enter a searchId"}).min(1),
    name: z.string({message: "enter a name"}).regex(/^[a-zA-Z]+$/,{message: "enter a valid name"})
})