-- CreateTable
CREATE TABLE "Homepage_about_us" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "heading" TEXT NOT NULL,
    "descr" TEXT NOT NULL,
    "btn_text" TEXT NOT NULL,
    "btn_url" TEXT NOT NULL,
    "image_1" TEXT NOT NULL,
    "image_2" TEXT NOT NULL,

    CONSTRAINT "Homepage_about_us_pkey" PRIMARY KEY ("id")
);
