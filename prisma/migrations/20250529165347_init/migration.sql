-- CreateTable
CREATE TABLE "Saved_heart_item" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "heading" TEXT NOT NULL,
    "add_button_icon" TEXT NOT NULL,
    "add_button_text" TEXT NOT NULL,
    "remove_button_icon" TEXT NOT NULL,
    "remove_button_text" TEXT NOT NULL,

    CONSTRAINT "Saved_heart_item_pkey" PRIMARY KEY ("id")
);
