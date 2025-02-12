/*
  Warnings:

  - You are about to alter the column `cost` on the `payments` table. The data in that column could be lost. The data in that column will be cast from `VarChar(1024)` to `Int`.

*/
-- AlterTable
ALTER TABLE `payments` MODIFY `cost` INTEGER NOT NULL;
