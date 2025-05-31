-- CreateTable
CREATE TABLE "Items_header" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "category_name" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "descr" TEXT NOT NULL,

    CONSTRAINT "Items_header_pkey" PRIMARY KEY ("id")
);
