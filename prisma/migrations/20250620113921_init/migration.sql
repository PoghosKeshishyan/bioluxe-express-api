/*
  Warnings:

  - You are about to drop the `ProductSize` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `color` to the `Item` table without a default value. This is not possible if the table is not empty.
  - Added the required column `size` to the `Item` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ProductSize" DROP CONSTRAINT "ProductSize_productId_fkey";

-- AlterTable
ALTER TABLE "Item" ADD COLUMN     "color" TEXT NOT NULL,
ADD COLUMN     "group_code" TEXT,
ADD COLUMN     "size" TEXT NOT NULL;

-- DropTable
DROP TABLE "ProductSize";

-- CreateTable
CREATE TABLE "Homepage_partners_heading" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "heading" TEXT NOT NULL,

    CONSTRAINT "Homepage_partners_heading_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Homepage_partner" (
    "id" TEXT NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "Homepage_partner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Item_faq_heading" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "heading" TEXT NOT NULL,

    CONSTRAINT "Item_faq_heading_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Item_faq" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "question" TEXT NOT NULL,
    "answer" TEXT NOT NULL,

    CONSTRAINT "Item_faq_pkey" PRIMARY KEY ("id")
);
