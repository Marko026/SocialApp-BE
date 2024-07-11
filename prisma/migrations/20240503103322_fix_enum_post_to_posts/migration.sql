/*
  Warnings:

  - The values [POST] on the enum `EContentType` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "EContentType_new" AS ENUM ('POSTS', 'MEETUP', 'PODCAST', 'GROUPS');
ALTER TABLE "Content" ALTER COLUMN "type" TYPE "EContentType_new" USING ("type"::text::"EContentType_new");
ALTER TYPE "EContentType" RENAME TO "EContentType_old";
ALTER TYPE "EContentType_new" RENAME TO "EContentType";
DROP TYPE "EContentType_old";
COMMIT;
