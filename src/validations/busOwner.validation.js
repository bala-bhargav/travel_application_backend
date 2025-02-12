import {z} from 'zod';

export const busOwnerValidation = z.object({
    age:z.number({message: "enter a number"}).min(8),
    email:z.string({message: "enter a email"}).email({message: "enter a valid email"}),
    ownerName:z.string({message: "enter a name"}).regex(/^[a-zA-Z]+$/,{message: "enter a valid name"}),
    phoneNumber:z.string({message: "enter a phone number"}).regex(/^[0-9]{10}$/,{message: "enter a valid phone number"}),

})