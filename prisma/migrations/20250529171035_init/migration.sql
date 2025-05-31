-- CreateTable
CREATE TABLE "Info_about_delivery" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "texts" JSONB NOT NULL,

    CONSTRAINT "Info_about_delivery_pkey" PRIMARY KEY ("id")
);
