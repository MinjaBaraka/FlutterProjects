/*
  Warnings:

  - You are about to alter the column `studentInstitution` on the `User` table. The data in that column could be lost. The data in that column will be cast from `TinyInt` to `VarChar(20)`.

*/
-- AlterTable
ALTER TABLE `User` MODIFY `studentInstitution` VARCHAR(20) NOT NULL;
