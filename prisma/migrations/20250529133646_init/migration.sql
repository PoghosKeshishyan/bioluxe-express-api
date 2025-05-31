-- CreateTable
CREATE TABLE "Navbar" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "route" TEXT NOT NULL,

    CONSTRAINT "Navbar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Submenu" (
    "id" TEXT NOT NULL,
    "lang" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "route" TEXT NOT NULL,
    "navbarId" TEXT,

    CONSTRAINT "Submenu_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Submenu" ADD CONSTRAINT "Submenu_navbarId_fkey" FOREIGN KEY ("navbarId") REFERENCES "Navbar"("id") ON DELETE SET NULL ON UPDATE CASCADE;
