-- CreateTable
CREATE TABLE "Slider" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "descr" TEXT NOT NULL,
    "btn_text" TEXT NOT NULL,
    "btn_url" TEXT NOT NULL,
    "background_image" TEXT NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "Slider_pkey" PRIMARY KEY ("id")
);
