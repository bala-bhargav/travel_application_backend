-- AlterTable
ALTER TABLE `searches` ADD COLUMN `busId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `searches` ADD CONSTRAINT `searches_busId_fkey` FOREIGN KEY (`busId`) REFERENCES `buses`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
