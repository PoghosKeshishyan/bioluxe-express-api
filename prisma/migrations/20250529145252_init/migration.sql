-- CreateTable
CREATE TABLE "Shopping_bag_page" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "main" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "empty_error_text" TEXT NOT NULL,
    "quantity_and_prais_text" TEXT NOT NULL,
    "size_title" TEXT NOT NULL,
    "heart_text" TEXT NOT NULL,
    "btn_text" TEXT NOT NULL,
    "order_summary_field" TEXT NOT NULL,
    "total_text_field" TEXT NOT NULL,
    "form_input_name_placeholder" TEXT NOT NULL,
    "form_input_tel_placeholder" TEXT NOT NULL,
    "form_input_address_placeholder" TEXT NOT NULL,
    "form_input_checkbox_text" TEXT NOT NULL,
    "form_btn_text" TEXT NOT NULL,

    CONSTRAINT "Shopping_bag_page_pkey" PRIMARY KEY ("id")
);
