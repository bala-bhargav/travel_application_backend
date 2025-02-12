-- CreateTable
CREATE TABLE `BookingHistory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Status` VARCHAR(1024) NOT NULL,
    `ticketId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `BookingHistory` ADD CONSTRAINT `BookingHistory_ticketId_fkey` FOREIGN KEY (`ticketId`) REFERENCES `Ticket`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BookingHistory` ADD CONSTRAINT `BookingHistory_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
