/*
  Warnings:

  - You are about to alter the column `status` on the `bookingHistories` table. The data in that column could be lost. The data in that column will be cast from `VarChar(1024)` to `Enum(EnumId(5))`.

*/
-- AlterTable
ALTER TABLE `bookingHistories` MODIFY `status` ENUM('pending', 'accepted') NOT NULL DEFAULT 'pending';
