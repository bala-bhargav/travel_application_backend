/*
  Warnings:

  - You are about to alter the column `paymentType` on the `payments` table. The data in that column could be lost. The data in that column will be cast from `VarChar(1024)` to `Enum(EnumId(3))`.

*/
-- AlterTable
ALTER TABLE `payments` MODIFY `paymentType` ENUM('creditCard', 'upi', 'debitCard', 'masterCard', 'visaCard') NOT NULL;
