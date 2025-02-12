/*
  Warnings:

  - You are about to drop the `BookingHistory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Bus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `BusOwner` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Payment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefreshToken` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Search` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Seat` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Stop` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Ticket` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Traveller` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `BookingHistory` DROP FOREIGN KEY `BookingHistory_ticketId_fkey`;

-- DropForeignKey
ALTER TABLE `BookingHistory` DROP FOREIGN KEY `BookingHistory_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Bus` DROP FOREIGN KEY `Bus_busOwnerId_fkey`;

-- DropForeignKey
ALTER TABLE `Payment` DROP FOREIGN KEY `Payment_userId_fkey`;

-- DropForeignKey
ALTER TABLE `RefreshToken` DROP FOREIGN KEY `RefreshToken_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Seat` DROP FOREIGN KEY `Seat_busId_fkey`;

-- DropForeignKey
ALTER TABLE `Stop` DROP FOREIGN KEY `Stop_searchId_fkey`;

-- DropForeignKey
ALTER TABLE `Ticket` DROP FOREIGN KEY `Ticket_busId_fkey`;

-- DropForeignKey
ALTER TABLE `Ticket` DROP FOREIGN KEY `Ticket_paymentId_fkey`;

-- DropForeignKey
ALTER TABLE `Ticket` DROP FOREIGN KEY `Ticket_seatId_fkey`;

-- DropForeignKey
ALTER TABLE `Ticket` DROP FOREIGN KEY `Ticket_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Traveller` DROP FOREIGN KEY `Traveller_seatId_fkey`;

-- DropForeignKey
ALTER TABLE `Traveller` DROP FOREIGN KEY `Traveller_ticketId_fkey`;

-- DropTable
DROP TABLE `BookingHistory`;

-- DropTable
DROP TABLE `Bus`;

-- DropTable
DROP TABLE `BusOwner`;

-- DropTable
DROP TABLE `Payment`;

-- DropTable
DROP TABLE `RefreshToken`;

-- DropTable
DROP TABLE `Search`;

-- DropTable
DROP TABLE `Seat`;

-- DropTable
DROP TABLE `Stop`;

-- DropTable
DROP TABLE `Ticket`;

-- DropTable
DROP TABLE `Traveller`;

-- DropTable
DROP TABLE `User`;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `firstName` VARCHAR(255) NOT NULL,
    `lastName` VARCHAR(255) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `role` ENUM('ADMIN', 'USER', 'STAFF', 'OWNER') NOT NULL DEFAULT 'USER',
    `password` VARCHAR(255) NOT NULL,
    `isVerified` BOOLEAN NOT NULL DEFAULT false,
    `emailVerifyToken` VARCHAR(255) NULL,
    `passwordResetToken` VARCHAR(255) NULL,
    `tokenSendAt` DATETIME(3) NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `refreshTokens` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `refreshToken` VARCHAR(1024) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `userId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `seats` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `seatNo` VARCHAR(1024) NOT NULL,
    `status` VARCHAR(1024) NOT NULL,
    `busId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `buses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `busName` VARCHAR(1024) NOT NULL,
    `busNumber` VARCHAR(1024) NOT NULL,
    `busType` VARCHAR(1024) NOT NULL,
    `busFuelCapacity` INTEGER NOT NULL,
    `busAddress` VARCHAR(1024) NOT NULL,
    `busOwnerId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `busOwners` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `ownerName` VARCHAR(1024) NOT NULL,
    `age` INTEGER NOT NULL,
    `phoneNumber` VARCHAR(1024) NOT NULL,
    `email` VARCHAR(1024) NOT NULL,
    `role` ENUM('ADMIN', 'USER', 'STAFF', 'OWNER') NOT NULL DEFAULT 'STAFF',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `travellers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(1024) NOT NULL,
    `age` VARCHAR(1024) NOT NULL,
    `gender` VARCHAR(1024) NOT NULL,
    `seatId` INTEGER NOT NULL,
    `phoneNumber` VARCHAR(1024) NOT NULL,
    `ticketId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stops` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(1024) NOT NULL,
    `searchId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `searches` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(1024) NOT NULL,
    `arrival` VARCHAR(1024) NOT NULL,
    `destination` VARCHAR(1024) NOT NULL,
    `busTimings` VARCHAR(1024) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `status` ENUM('pending', 'accepted') NOT NULL DEFAULT 'pending',
    `cost` VARCHAR(1024) NOT NULL,
    `paymentType` VARCHAR(1024) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `busId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,
    `seatId` INTEGER NOT NULL,
    `paymentId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bookingHistories` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(1024) NOT NULL,
    `ticketId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `refreshTokens` ADD CONSTRAINT `refreshTokens_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `seats` ADD CONSTRAINT `seats_busId_fkey` FOREIGN KEY (`busId`) REFERENCES `buses`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `buses` ADD CONSTRAINT `buses_busOwnerId_fkey` FOREIGN KEY (`busOwnerId`) REFERENCES `busOwners`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `travellers` ADD CONSTRAINT `travellers_seatId_fkey` FOREIGN KEY (`seatId`) REFERENCES `seats`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `travellers` ADD CONSTRAINT `travellers_ticketId_fkey` FOREIGN KEY (`ticketId`) REFERENCES `tickets`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stops` ADD CONSTRAINT `stops_searchId_fkey` FOREIGN KEY (`searchId`) REFERENCES `searches`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payments` ADD CONSTRAINT `payments_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_busId_fkey` FOREIGN KEY (`busId`) REFERENCES `buses`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_seatId_fkey` FOREIGN KEY (`seatId`) REFERENCES `seats`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `payments`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bookingHistories` ADD CONSTRAINT `bookingHistories_ticketId_fkey` FOREIGN KEY (`ticketId`) REFERENCES `tickets`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `bookingHistories` ADD CONSTRAINT `bookingHistories_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
