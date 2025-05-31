-- CreateTable
CREATE TABLE "Item_link" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "item" TEXT NOT NULL,
    "catalog" TEXT NOT NULL,
    "cribs" TEXT NOT NULL,

    CONSTRAINT "Item_link_pkey" PRIMARY KEY ("id")
);
