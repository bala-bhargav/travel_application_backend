-- DropForeignKey
ALTER TABLE `RefreshToken` DROP FOREIGN KEY `RefreshToken_user_id_fkey`;

-- DropIndex
DROP INDEX `RefreshToken_user_id_fkey` ON `RefreshToken`;

-- CreateTable
CREATE TABLE `Seat` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `seat_no` VARCHAR(1024) NOT NULL,
    `status` VARCHAR(1024) NOT NULL,
    `busId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Bus` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bus_name` VARCHAR(1024) NOT NULL,
    `bus_number` VARCHAR(1024) NOT NULL,
    `bus_type` VARCHAR(1024) NOT NULL,
    `bus_fuelcapacity` INTEGER NOT NULL,
    `bus_address` VARCHAR(1024) NOT NULL,
    `busOwnerId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BusOwner` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `owner_name` VARCHAR(1024) NOT NULL,
    `age` INTEGER NOT NULL,
    `phonenumber` VARCHAR(1024) NOT NULL,
    `email` VARCHAR(1024) NOT NULL,
    `role` ENUM('ADMIN', 'USER', 'STAFF', 'OWNER') NOT NULL DEFAULT 'STAFF',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Traveller` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(1024) NOT NULL,
    `age` VARCHAR(1024) NOT NULL,
    `gender` VARCHAR(1024) NOT NULL,
    `seatId` INTEGER NOT NULL,
    `phonenumber` VARCHAR(1024) NOT NULL,
    `ticketId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Stop` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(1024) NOT NULL,
    `searchId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Search` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(1024) NOT NULL,
    `arrival` VARCHAR(1024) NOT NULL,
    `destination` VARCHAR(1024) NOT NULL,
    `bustimings` VARCHAR(1024) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patyment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `Status` VARCHAR(1024) NOT NULL,
    `cost` VARCHAR(1024) NOT NULL,
    `paymentType` VARCHAR(1024) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ticket` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `busId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,
    `seatId` INTEGER NOT NULL,
    `patymentId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `RefreshToken` ADD CONSTRAINT `RefreshToken_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Seat` ADD CONSTRAINT `Seat_busId_fkey` FOREIGN KEY (`busId`) REFERENCES `Bus`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Bus` ADD CONSTRAINT `Bus_busOwnerId_fkey` FOREIGN KEY (`busOwnerId`) REFERENCES `BusOwner`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Traveller` ADD CONSTRAINT `Traveller_seatId_fkey` FOREIGN KEY (`seatId`) REFERENCES `Seat`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Traveller` ADD CONSTRAINT `Traveller_ticketId_fkey` FOREIGN KEY (`ticketId`) REFERENCES `Ticket`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Stop` ADD CONSTRAINT `Stop_searchId_fkey` FOREIGN KEY (`searchId`) REFERENCES `Search`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Patyment` ADD CONSTRAINT `Patyment_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_busId_fkey` FOREIGN KEY (`busId`) REFERENCES `Bus`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_seatId_fkey` FOREIGN KEY (`seatId`) REFERENCES `Seat`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_patymentId_fkey` FOREIGN KEY (`patymentId`) REFERENCES `Patyment`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
