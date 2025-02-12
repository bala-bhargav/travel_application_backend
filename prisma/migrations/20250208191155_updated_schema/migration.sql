/*
  Warnings:

  - You are about to drop the column `Status` on the `BookingHistory` table. All the data in the column will be lost.
  - You are about to drop the column `bus_address` on the `Bus` table. All the data in the column will be lost.
  - You are about to drop the column `bus_fuelcapacity` on the `Bus` table. All the data in the column will be lost.
  - You are about to drop the column `bus_name` on the `Bus` table. All the data in the column will be lost.
  - You are about to drop the column `bus_number` on the `Bus` table. All the data in the column will be lost.
  - You are about to drop the column `bus_type` on the `Bus` table. All the data in the column will be lost.
  - You are about to drop the column `owner_name` on the `BusOwner` table. All the data in the column will be lost.
  - You are about to drop the column `phonenumber` on the `BusOwner` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `RefreshToken` table. All the data in the column will be lost.
  - You are about to drop the column `refresh_token` on the `RefreshToken` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `RefreshToken` table. All the data in the column will be lost.
  - You are about to drop the column `user_id` on the `RefreshToken` table. All the data in the column will be lost.
  - You are about to drop the column `bustimings` on the `Search` table. All the data in the column will be lost.
  - You are about to drop the column `seat_no` on the `Seat` table. All the data in the column will be lost.
  - You are about to drop the column `patymentId` on the `Ticket` table. All the data in the column will be lost.
  - You are about to drop the column `phonenumber` on the `Traveller` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `email_verify_token` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `first_name` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `is_verified` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `last_name` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `password_reset_token` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `token_send_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Patyment` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `status` to the `BookingHistory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `busAddress` to the `Bus` table without a default value. This is not possible if the table is not empty.
  - Added the required column `busFuelCapacity` to the `Bus` table without a default value. This is not possible if the table is not empty.
  - Added the required column `busName` to the `Bus` table without a default value. This is not possible if the table is not empty.
  - Added the required column `busNumber` to the `Bus` table without a default value. This is not possible if the table is not empty.
  - Added the required column `busType` to the `Bus` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ownerName` to the `BusOwner` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneNumber` to the `BusOwner` table without a default value. This is not possible if the table is not empty.
  - Added the required column `refreshToken` to the `RefreshToken` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `RefreshToken` table without a default value. This is not possible if the table is not empty.
  - Added the required column `busTimings` to the `Search` table without a default value. This is not possible if the table is not empty.
  - Added the required column `seatNo` to the `Seat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `paymentId` to the `Ticket` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneNumber` to the `Traveller` table without a default value. This is not possible if the table is not empty.
  - Added the required column `firstName` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastName` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `BookingHistory` DROP FOREIGN KEY `BookingHistory_ticketId_fkey`;

-- DropForeignKey
ALTER TABLE `BookingHistory` DROP FOREIGN KEY `BookingHistory_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Patyment` DROP FOREIGN KEY `Patyment_userId_fkey`;

-- DropForeignKey
ALTER TABLE `RefreshToken` DROP FOREIGN KEY `RefreshToken_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `Stop` DROP FOREIGN KEY `Stop_searchId_fkey`;

-- DropForeignKey
ALTER TABLE `Ticket` DROP FOREIGN KEY `Ticket_busId_fkey`;

-- DropForeignKey
ALTER TABLE `Ticket` DROP FOREIGN KEY `Ticket_patymentId_fkey`;

-- DropForeignKey
ALTER TABLE `Ticket` DROP FOREIGN KEY `Ticket_seatId_fkey`;

-- DropForeignKey
ALTER TABLE `Ticket` DROP FOREIGN KEY `Ticket_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Traveller` DROP FOREIGN KEY `Traveller_seatId_fkey`;

-- DropForeignKey
ALTER TABLE `Traveller` DROP FOREIGN KEY `Traveller_ticketId_fkey`;

-- DropIndex
DROP INDEX `BookingHistory_ticketId_fkey` ON `BookingHistory`;

-- DropIndex
DROP INDEX `BookingHistory_userId_fkey` ON `BookingHistory`;

-- DropIndex
DROP INDEX `RefreshToken_user_id_fkey` ON `RefreshToken`;

-- DropIndex
DROP INDEX `Stop_searchId_fkey` ON `Stop`;

-- DropIndex
DROP INDEX `Ticket_busId_fkey` ON `Ticket`;

-- DropIndex
DROP INDEX `Ticket_patymentId_fkey` ON `Ticket`;

-- DropIndex
DROP INDEX `Ticket_seatId_fkey` ON `Ticket`;

-- DropIndex
DROP INDEX `Ticket_userId_fkey` ON `Ticket`;

-- DropIndex
DROP INDEX `Traveller_seatId_fkey` ON `Traveller`;

-- DropIndex
DROP INDEX `Traveller_ticketId_fkey` ON `Traveller`;

-- AlterTable
ALTER TABLE `BookingHistory` DROP COLUMN `Status`,
    ADD COLUMN `status` VARCHAR(1024) NOT NULL;

-- AlterTable
ALTER TABLE `Bus` DROP COLUMN `bus_address`,
    DROP COLUMN `bus_fuelcapacity`,
    DROP COLUMN `bus_name`,
    DROP COLUMN `bus_number`,
    DROP COLUMN `bus_type`,
    ADD COLUMN `busAddress` VARCHAR(1024) NOT NULL,
    ADD COLUMN `busFuelCapacity` INTEGER NOT NULL,
    ADD COLUMN `busName` VARCHAR(1024) NOT NULL,
    ADD COLUMN `busNumber` VARCHAR(1024) NOT NULL,
    ADD COLUMN `busType` VARCHAR(1024) NOT NULL;

-- AlterTable
ALTER TABLE `BusOwner` DROP COLUMN `owner_name`,
    DROP COLUMN `phonenumber`,
    ADD COLUMN `ownerName` VARCHAR(1024) NOT NULL,
    ADD COLUMN `phoneNumber` VARCHAR(1024) NOT NULL;

-- AlterTable
ALTER TABLE `RefreshToken` DROP COLUMN `created_at`,
    DROP COLUMN `refresh_token`,
    DROP COLUMN `updated_at`,
    DROP COLUMN `user_id`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `refreshToken` VARCHAR(1024) NOT NULL,
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    ADD COLUMN `userId` INTEGER NULL;

-- AlterTable
ALTER TABLE `Search` DROP COLUMN `bustimings`,
    ADD COLUMN `busTimings` VARCHAR(1024) NOT NULL;

-- AlterTable
ALTER TABLE `Seat` DROP COLUMN `seat_no`,
    ADD COLUMN `seatNo` VARCHAR(1024) NOT NULL;

-- AlterTable
ALTER TABLE `Ticket` DROP COLUMN `patymentId`,
    ADD COLUMN `paymentId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Traveller` DROP COLUMN `phonenumber`,
    ADD COLUMN `phoneNumber` VARCHAR(1024) NOT NULL;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `created_at`,
    DROP COLUMN `email_verify_token`,
    DROP COLUMN `first_name`,
    DROP COLUMN `is_verified`,
    DROP COLUMN `last_name`,
    DROP COLUMN `password_reset_token`,
    DROP COLUMN `token_send_at`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `emailVerifyToken` VARCHAR(255) NULL,
    ADD COLUMN `firstName` VARCHAR(255) NOT NULL,
    ADD COLUMN `isVerified` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `lastName` VARCHAR(255) NOT NULL,
    ADD COLUMN `passwordResetToken` VARCHAR(255) NULL,
    ADD COLUMN `tokenSendAt` DATETIME(3) NULL,
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL;

-- DropTable
DROP TABLE `Patyment`;

-- CreateTable
CREATE TABLE `Payment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `status` VARCHAR(1024) NOT NULL,
    `cost` VARCHAR(1024) NOT NULL,
    `paymentType` VARCHAR(1024) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `RefreshToken` ADD CONSTRAINT `RefreshToken_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Traveller` ADD CONSTRAINT `Traveller_seatId_fkey` FOREIGN KEY (`seatId`) REFERENCES `Seat`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Traveller` ADD CONSTRAINT `Traveller_ticketId_fkey` FOREIGN KEY (`ticketId`) REFERENCES `Ticket`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Stop` ADD CONSTRAINT `Stop_searchId_fkey` FOREIGN KEY (`searchId`) REFERENCES `Search`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_busId_fkey` FOREIGN KEY (`busId`) REFERENCES `Bus`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_seatId_fkey` FOREIGN KEY (`seatId`) REFERENCES `Seat`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `Payment`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BookingHistory` ADD CONSTRAINT `BookingHistory_ticketId_fkey` FOREIGN KEY (`ticketId`) REFERENCES `Ticket`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BookingHistory` ADD CONSTRAINT `BookingHistory_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
