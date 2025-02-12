/*
  Warnings:

  - You are about to alter the column `gender` on the `travellers` table. The data in that column could be lost. The data in that column will be cast from `VarChar(1024)` to `Enum(EnumId(2))`.

*/
-- AlterTable
ALTER TABLE `travellers` MODIFY `gender` ENUM('male', 'female') NOT NULL DEFAULT 'male';
