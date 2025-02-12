/*
  Warnings:

  - You are about to alter the column `age` on the `travellers` table. The data in that column could be lost. The data in that column will be cast from `VarChar(1024)` to `Int`.

*/
-- AlterTable
ALTER TABLE `travellers` MODIFY `age` INTEGER NOT NULL;
