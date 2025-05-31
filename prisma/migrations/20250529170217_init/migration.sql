-- CreateTable
CREATE TABLE "Item_page_field" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "size_text_field" TEXT NOT NULL,
    "size_text_field_2" TEXT NOT NULL,
    "descr_text_field" TEXT NOT NULL,
    "product_number_text_field" TEXT NOT NULL,
    "material_text_field" TEXT NOT NULL,
    "about_delivery_text_field" TEXT NOT NULL,
    "not_available_text_field" TEXT NOT NULL,

    CONSTRAINT "Item_page_field_pkey" PRIMARY KEY ("id")
);
