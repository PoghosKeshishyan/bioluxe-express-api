-- CreateTable
CREATE TABLE "Categories_link" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "main" TEXT NOT NULL,
    "catalog" TEXT NOT NULL,
    "filter_by" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "materials" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "sort_by" TEXT NOT NULL,
    "from" TEXT NOT NULL,
    "to" TEXT NOT NULL,

    CONSTRAINT "Categories_link_pkey" PRIMARY KEY ("id")
);
