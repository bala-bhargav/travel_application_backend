/*
  Warnings:

  - You are about to alter the column `status` on the `seats` table. The data in that column could be lost. The data in that column will be cast from `VarChar(1024)` to `Enum(EnumId(1))`.

*/
-- AlterTable
ALTER TABLE `seats` MODIFY `status` ENUM('available', 'occupied') NOT NULL DEFAULT 'available';
