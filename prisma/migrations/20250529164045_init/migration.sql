-- CreateTable
CREATE TABLE "Contact_form" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "input_placeholder_name" TEXT NOT NULL,
    "input_placeholder_email" TEXT NOT NULL,
    "input_placeholder_phone" TEXT NOT NULL,
    "btn_text" TEXT NOT NULL,
    "priacy_policy_text" TEXT NOT NULL,
    "priacy_policy_url" TEXT NOT NULL,

    CONSTRAINT "Contact_form_pkey" PRIMARY KEY ("id")
);
