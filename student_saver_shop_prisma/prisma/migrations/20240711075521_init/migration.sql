/*
  Warnings:

  - You are about to drop the column `imageUrl` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `User` DROP COLUMN `imageUrl`,
    ADD COLUMN `imageFile` VARCHAR(255) NULL;
