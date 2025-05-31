-- CreateTable
CREATE TABLE "Saved_basket_item" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "heading" TEXT NOT NULL,
    "quantity" TEXT NOT NULL,
    "remove_button_icon" TEXT NOT NULL,
    "remove_button_text" TEXT NOT NULL,

    CONSTRAINT "Saved_basket_item_pkey" PRIMARY KEY ("id")
);
