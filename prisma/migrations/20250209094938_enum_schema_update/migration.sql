-- AlterTable
ALTER TABLE `payments` MODIFY `paymentType` ENUM('creditCard', 'upi', 'debitCard', 'masterCard', 'visaCard') NOT NULL DEFAULT 'upi';
