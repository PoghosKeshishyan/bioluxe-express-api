-- CreateTable
CREATE TABLE "Contact_info" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "map_image" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address_icon" TEXT NOT NULL,
    "phone_icon" TEXT NOT NULL,
    "email_icon" TEXT NOT NULL,

    CONSTRAINT "Contact_info_pkey" PRIMARY KEY ("id")
);
