-- CreateTable
CREATE TABLE "HomePagePopularItem" (
    "id" TEXT NOT NULL,
    "itemId" TEXT NOT NULL,
    "order" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "HomePagePopularItem_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "HomePagePopularItem" ADD CONSTRAINT "HomePagePopularItem_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Item"("id") ON DELETE CASCADE ON UPDATE CASCADE;
